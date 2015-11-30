#!/usr/bin/perl

use strict;
use warnings;

use List::Util qw(any all notall none notall first max maxstr min minstr reduce shuffle sum);

my $result = maxstr 'abcd', "bc";

print "$result\n";

