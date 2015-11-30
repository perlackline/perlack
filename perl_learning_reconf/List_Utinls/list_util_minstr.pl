#!/usr/bin/perl

use strict;
use warnings;

use List::Util qw(any all notall none notall first max maxstr min minstr reduce shuffle sum);

my @list = 'A'..'Z';

my $result = minstr @list;

print "$result\n";

