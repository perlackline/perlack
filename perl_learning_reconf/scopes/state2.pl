#!/usr/bin/perl

use strict;
use warnings;
use 5.010;

my $code_ref = sub {
    state $count = 1;
    print "$count\n";
    $count++;
  };

my $x = $code_ref;
my $y = $code_ref;

foreach (0..2) {
  $x->();
}

print "---\n";

foreach (0..2) {
  $y->();
}
