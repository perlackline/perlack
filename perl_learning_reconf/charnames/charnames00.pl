#!/usr/bin/perl

use strict;
use warnings;

use charnames qw(:full);

print $charnames::VERSION, "\n";
binmode STDOUT, 'utf8';
#binmode STDOUT, ':encoding(UTF-8)';

print "\N{GREEK SMALL LETTER SIGMA} is called sigma.\n";
#print "\N{LATIN CAPITAL LETTER E WITH VERTICAL LINE BELOW}",
#      " is an officially named sequence of two Unicode characters\n";

#print "\N{Greek small-letter  sigma}",
#        "can be used to ignore case, underscores, most blanks,",
#        "and when you aren't sure if the official name has hyphens\n";

use charnames ':short';
print "\N{greek:Sigma} is an upper-case sigma.\n";

use charnames qw(cyrillic greek);
print "\N{sigma} is Greek sigma, and \N{be} is Cyrillic b.\n";

use charnames ":full", ":alias" => {
  e_ACUTE => "LATIN SMALL LETTER E WITH ACUTE",
};
print "\N{e_ACUTE} is a small letter e with an acute.\n";

print "\n--- ---\n";
use charnames ();
print charnames::viacode(0x1234); # prints "ETHIOPIC SYLLABLE SEE"
print "\n";
printf "%04X", charnames::vianame("GOTHIC LETTER AHSA"); # prints "10330"
print "\n";

