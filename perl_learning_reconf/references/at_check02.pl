#!/usr/bin/perl

use strict;
use warnings;

my %hash = ( a => 1, b => 2 );

foreach (keys %hash) {
  print "$_ : $hash{$_}\n";
}

check_arg(%hash);

sub check_arg {
  print "@_\n";
  foreach (@_) {
    print "$_\n";
  }
}
