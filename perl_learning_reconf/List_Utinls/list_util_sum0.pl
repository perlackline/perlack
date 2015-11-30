#!/usr/bin/perl

use strict;
use warnings;

use List::Util qw(any all notall none notall first max maxstr min minstr product reduce shuffle sum sum0);

my @list = ();

my $result = sum0 @list;

print "$result\n";

