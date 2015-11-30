#!/usr/bin/perl

use strict;
use warnings;

use List::Util qw(any all notall none notall first max maxstr min minstr reduce shuffle sum);

#my @list = qw/one two three four /;
my @list1 = qw/1 2 3 4 5/;
my @list2 = qw/6 7 8 9 10/;

my $result = max 0..99;
#my $result = max @list1, @list2;

print "$result\n";

