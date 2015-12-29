#!/usr/bin/perl

use strict;
use warnings;

use charnames qw(:full);

binmode STDOUT, 'utf8';

printf "%04X\n", charnames::vianame("FOUR TEARDROP-SPOKED ASTERISK");
#print charnames::viacode(0xFEFF), "\n";
#print "\N{FOUR TEARDROP-SPOKED ASTERISK}\n";
#print "\N{U+263a}\n";
#print "\N{WHITE SMILING FACE}\n";

