#!/usr/bin/perl

use strict;
use warnings;

# addition
sub add {
  my ($left, $right) = @_;
  return print 'add: ', $left + $right. "\n";
}
# minus
sub min {
  my ($left, $right) = @_;
  return print 'min: ', $left - $right. "\n";
}
# multiplication
sub mul {
  my ($left, $right) = @_;
  return print 'mul: ', $left * $right. "\n";
  
}
# division
sub div {
  my ($left, $right) = @_;
  return $left / $right. "\n";
#  unless ($right == 0 ) {
#  return  print 'div: ', $left - $right. "\n";;
#  } else {
#    #print "'ゼロ除算' です\n"; 
#    die "'ゼロ除算' です\n"; 
#  }
}

add(5,5);
min(5,4);
mul(5,5);
div(6,2);
#div(6,0);

