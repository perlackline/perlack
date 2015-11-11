#!/usr/bin/perl

use strict;
use warnings;
use 5.010;

sub outer {
  state $count = 1;
  sub {
    print "$count\n";
    $count++;
  };
}

my $x = outer();
my $y = outer();

foreach (0..2) {
  $x->();
}

print "---\n";

foreach (0..2) {
  $y->();
}
