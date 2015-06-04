#!/usr/bin/perl
use strict;
use warnings;
#use utf8:

use Time::Piece;

# コメント
my @days = qw/ 日 月 火 水 木 金 土 /;

#my $ja_day = localtime->day(@days);
#print "ja_day:  $ja_day\n";
#
my $t = localtime;
#printf "ja_day2: %s\n", $t->day(@days);

Time::Piece::day_list(@days);

printf "jp_day: %s\n", $t->day();
