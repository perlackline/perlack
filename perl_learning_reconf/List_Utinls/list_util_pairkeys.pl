#!/usr/bin/perl

use strict;
use warnings;

use List::Util qw(pairvalues pairkeys pairs unpairs);

my @kvlist = qw(one 1 two 2 three 3);

#@kvlist = pairkeys @kvlist;
@kvlist = pairvalues @kvlist;

map { print "$_\n" } @kvlist;

