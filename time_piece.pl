#!/usr/bin/perl
use strict;
use warnings;

use Time::Piece;

my $t = localtime;
print "Time is  $t\n";

print "Year is  ", $t->year, "\n";
print "Month is ", $t->month, "\n";
print "Day is   ", $t->day, "\n";
print "Mday is  ", $t->mday, "\n";

print "ymd() ", $t->ymd, "\n";
print "epoch() ", $t->epoch, "\n";

my $time = localtime;
print "\n$time\n";
