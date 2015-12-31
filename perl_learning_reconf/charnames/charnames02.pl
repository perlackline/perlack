#!/usr/bin/perl

use strict;
use warnings;

use charnames ':full';

binmode STDOUT, ':utf8';

#print "\N{WHITE FROWNING FACE}\n";
#print "\N{WHITE SMILING FACE}\n";
#print "\N{BLACK SMILING FACE}\n";
#print "\N{WHITE SUN WITH RAYS}\n";
#print "\N{MERCURY}\n";
#print "\N{FEMALE SIGN}\n";
#print "\N{EARTH}\n";
#print "\N{MALE SIGN}\n";
#print "\N{JUPITER}\n";
#print "\N{SATURN}\n";
#print "\N{URANUS}\n";
#print "\N{NEPTUNE}\n";
#print "\N{PLUTO}\n";
print "\N{U+2639}\n";
print "\N{U+263A}\n";

my $hebrew_alef = chr(0x05d0);
print "hebrew_alef : $hebrew_alef\n";
my $georgian_an = pack("U*", 0x10a0);
print "getgian_an : $georgian_an\n";

print chr(0x263A), "\n";
print pack("U*",0x263A), "\n";
