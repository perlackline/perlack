#!/usr/bin/perl

use strict;
use warnings;

use List::Util qw(any all none notall first max maxstr min minstr reduce shuffle sum);

my @list = qw/one two three four /;

my $result = none{ length > 4 } @list;

print "$result\n";
