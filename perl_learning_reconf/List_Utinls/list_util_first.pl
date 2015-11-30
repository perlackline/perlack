#!/usr/bin/perl

use strict;
use warnings;

use List::Util qw(any all notall none notall first max maxstr min minstr reduce shuffle sum);

my @list = qw/one two three four /;

#my @result = first { length > 3 } @list;
my @result = first { defined } @list;

print "@result\n";

