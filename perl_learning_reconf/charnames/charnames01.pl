#!/usr/bin/perl

use strict;
use warnings;

use charnames qw(:full);

binmode STDOUT, 'utf8';

my $char = "FOUR TEARDROP-SPOKED ASTERISK";
print "\N{$char}\n";
print "charnames::vianame($char) \n";
#my $char = "\N{FOUR TEARDROP-SPOKED ASTERISK}";
#print "$char\n";
#printf "%04X\n", charnames::vianame("FOUR TEARDROP-SPOKED ASTERISK");
#print charnames::viacode(0xFEFF), "\n";
#print "\N{FOUR TEARDROP-SPOKED ASTERISK}\n";
#print "\N{U+263a}\n";
#print "\N{WHITE SMILING FACE}\n";

