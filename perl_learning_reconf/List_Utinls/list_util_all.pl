#!/usr/bin/perl

use strict;
use warnings;

use List::Util qw(any all first max maxstr min minstr reduce shuffle sum);

my @list = qw/one two three/;

#  
my $result = all{ length > 2 } @list;

#my @result = any{ length > 1  } @list;

print "$result\n";
#print "@result\n";
