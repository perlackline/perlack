#!/usr/bin/perl

use strict;
use warnings;

# from JavaScript

sub someAction {
  my ($x,$y,$sub) = @_;
  return $sub->($x,$y);
}

my $calcProduct = sub {
  my ($x,$y) = @_;
  return $x * $y;
};

my $calcSum = sub {
  my ($x,$y) = @_;
  return $x + $y;
};

# print 75, the product 5 and 15
print someAction(5,15,$calcProduct), "\n";
# print 20, the sum 5 and 15
print someAction(5,15,$calcSum), "\n";

