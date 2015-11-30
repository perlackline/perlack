#!/usr/bin/perl

use strict;
use warnings;

use List::Util qw(any first max maxstr min minstr reduce shuffle sum);

my @list = qw/one two three/;

# 1 
my $result = any{ length > 4 } @list;

my @result = any{ length > 1  } @list;


print "@result\n";
