#!/usr/bin/perl

use strict;
use warnings;

# ============================
sub high_water_mark {
  my $ref_length = shift;
  my $max_length = length $ref_length;

  foreach (@_) {
    my $next_length = length $_;
    if ($next_length > $max_length) {
      $max_length = $next_length;
    }
  }
  "%-${max_length}s : %s\n";
}

my @keys = sort(keys %ENV);
my $format = high_water_mark(@keys);

printf $format, $_, $ENV{$_} for @keys;

#foreach (@keys){
#  printf $format, $_, $ENV{$_};
#}



