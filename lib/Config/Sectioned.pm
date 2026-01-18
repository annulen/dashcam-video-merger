package Config::Sectioned;

use Carp;

use strict;
use warnings;

# TODO: utf, docs, tests

my %sections;
my $currentSectionName;
my @currentLines;

sub _save_current_section_if_needed {
    if ($currentSectionName) {
        # TODO: Support \n join as option?
        $sections{$currentSectionName} = join ' ', @currentLines;
        @currentLines = ();
    }
}

sub read_file {
    my $filename = shift;
    open my $fh, '<', $filename or carp "Failed to read file '$filename': $!";

    while(<$fh>) {
        # Preprocess line: remove leading&trailing spaces and inline comments
        s/^\s+//;
        s/#.*$//;
        s/\s+$//;

        # Skip empty lines
        next if /^$/;

        # [section]
        if (/^\[\s*(.+?)\s*\]$/) {
            my $sectionName = $1;
            if (exists $sections{$sectionName}) {
                croak "Section '$sectionName' was redefined at $filename:$.";
            }
            _save_current_section_if_needed();
            $currentSectionName = $sectionName;
        } else {
            # Regular line
            $currentSectionName or croak "No section has been opened yet at $filename:$.";
            push @currentLines, $_;
        }
    }
    _save_current_section_if_needed();
    return \%sections;
}

1;

__END__

=pod

=head1 NAME

Config::Sectioned - Read config files with ini-style sections which are parsed as line-wrapped strings

=cut
