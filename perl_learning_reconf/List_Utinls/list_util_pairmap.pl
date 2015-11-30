#!/usr/bin/perl

use strict;
use warnings;

use List::Util qw(pairmap pairfirst pairgrep pairvalues pairkeys pairs unpairs);

my @kvlist = qw(one 1 two 2 three 3);

my @subset = pairmap { "The key $a has value $b" } @kvlist;

map { print "\@subset: $_\n" } @subset;
#map { print "\@kvlist: $_\n" } @kvlist;

