#!/usr/bin/perl

use strict;
use warnings;

my %in_the_pocket = (
        Al     => 148,
        Chris  => 168,
        Bernie => 181,
);

my @a_order = 
  sort { $in_the_pocket{$b} <=> $in_the_pocket{$a} } keys %in_the_pocket;

foreach (@a_order) {
  print "$_ : $in_the_pocket{$_}\n";
}

my @key_order = 
  sort { $b cmp $a } keys %in_the_pocket;
#my @key_order = 
#  sort keys %in_the_pocket;

foreach (@key_order) {
  print "$_ : $in_the_pocket{$_}\n";
}




