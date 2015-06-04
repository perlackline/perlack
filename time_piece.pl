#!/usr/bin/perl
use strict;
use warnings;

use Time::Piece;

my @days = qw/ $BF|(B $B7n(B $B2P(B $B?e(B $BLZ(B $B6b(B $BEZ(B /;

#my $ja_day = localtime->day(@days);
#print "ja_day:  $ja_day\n";
#
my $t = localtime;
#printf "ja_day2: %s\n", $t->day(@days);

Time::Piece::day_list(@days);

printf "jp_day: %s\n", $t->day();
