#!/usr/bin/perl

use strict;
use warnings;

use List::Util qw(any all notall none notall first max maxstr min minstr product reduce shuffle sum);

my @list = ();

my $result = sum @list;
#my $result = sum 1..9;

print "$result\n";

