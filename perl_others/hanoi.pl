#!/usr/bin/perl

use strict;
use warnings;

# Tower of Hanoi.
# H(n)
my $count = 0;
hanoi (3, 'A', 'B', 'C');
print "\n";
print "$count\n";

sub hanoi {
  my ($n,$x,$y,$z) = @_; 

  if ($n == 0){
    # 何もしない
  } else {
    hanoi ($n - 1, $x, $z, $y);
    printf "%s->%s, ", $x, $y;
    hanoi ($n - 1, $z, $y, $x);
  print $count++, " ";
  }
}
 
