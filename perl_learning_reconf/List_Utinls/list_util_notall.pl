#!/usr/bin/perl

use strict;
use warnings;

use List::Util qw(any all notall none notall first max maxstr min minstr reduce shuffle sum);

my @list = qw/on two three four /;

my $result = notall{ length > 2 } @list;

print "$result\n";
