#!/usr/bin/perl

use strict;
use warnings;

sub max {
  my $max_so_far = shift @_;
  foreach ( @_ ) {
    if ( $_ > $max_so_far ) {
      $max_so_far = $_;
    }
  }
  $max_so_far;
}

my $maximum = max(qw/3 5 19 4 6/);
print "$maximum\n";


