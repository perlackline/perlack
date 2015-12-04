#!/usr/bin/perl

use strict;
use warnings;

use List::MoreUtils ':all';

use v5.10;

my @idx = (0, 1, -1);
#my @idx = (0, 1, 2);
my $i = 0;
#my @x = part { $idx[$i++ % 3] } 1..8;
my @x = part { $i++ % 3 } 1..8;
#my @x = part { 2 } qw(a b);
#my @x = part { $i++ % 2 } @a;
#my @x = part { $i++ % 2 } 1..8;

#my @x = after_incl { $_ % 5 == 0 } 1..9;
#print "x  : $x\n";
#print "x  : @{$x[2]}\n";
print "x  : @x\n";

print "--- x ---\n";
foreach my $n ( 0..$#x ) {
  print $x[$n], "\n";
  print "($n)";
  print join(',', @{$x[$n]}), "\n";
}


