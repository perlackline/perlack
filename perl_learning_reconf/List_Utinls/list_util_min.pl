#!/usr/bin/perl

use strict;
use warnings;

use List::Util qw(any all notall none notall first max maxstr min minstr reduce shuffle sum);

my @list1 = qw/3 4 5/;
my @list2 = qw/6 7 8 9 10/;

#my $result = min 5..99;
my $result = min @list1, @list2;

print "$result\n";

