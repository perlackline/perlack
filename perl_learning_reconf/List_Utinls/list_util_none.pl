#!/usr/bin/perl

use strict;
use warnings;

use List::Util qw(any all none notall first max maxstr min minstr reduce shuffle sum);

my @list = qw/on two three four /;

my $result = none{ length > 5 } @list;

print "$result\n";
