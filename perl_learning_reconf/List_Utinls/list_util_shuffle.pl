#!/usr/bin/perl

use strict;
use warnings;

use List::Util qw(shuffle pairmap pairfirst pairgrep pairvalues pairkeys pairs unpairs);

my @kvlist = qw(1 2 3 4 5);

my @shuffled = shuffle @kvlist;

print "@shuffled\n";
#map { print "\@subset: $_\n" } @subset;
#map { print "\@kvlist: $_\n" } @kvlist;

