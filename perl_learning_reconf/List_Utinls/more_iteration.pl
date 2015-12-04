#!/usr/bin/perl

use strict;
use warnings;

use List::MoreUtils ':all';

my @x = 'a'..'g';

my $it = natatime 3, @x;
#my $ea = each_arrayref $a, $b, $c;

print $it->(), "\n";
print $it->(), "\n";
print $it->(), "\n";

#while (my @vals = $it->()) {
#  print "--- loop ---\n";
#  print "@vals\n";
#}

