#!/usr/bin/perl

use strict;
use warnings;

use List::MoreUtils ':all';

my @list = 99..599999;
my @x = minmax @list;

print "@x\n";
#printf "%i item(s) are not defined\n", false { defined($_) } @list;
#printf "%i item(s) are defined\n", true { defined($_) } @list;
#printf "%i item(s) are defined\n", true { defined($_) } undef, 1, 2;

