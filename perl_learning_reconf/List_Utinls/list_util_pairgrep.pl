#!/usr/bin/perl

use strict;
use warnings;

use List::Util qw(pairgrep pairvalues pairkeys pairs unpairs);

my @kvlist = qw(ONE 1 TWO 2 THREE 3);

my @subset = pairgrep { $a =~ s/([[:upper:]]+)/\L$1/ } @kvlist;
#my @subset = pairgrep { $a =~ /^[[:upper:]]+$/ } @kvlist;

map { print "\@subset: $_\n" } @subset;
map { print "\@kvlist: $_\n" } @kvlist;
