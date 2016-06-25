#!/usr/bin/perl

use strict;
use warnings;

my @array = (qw/9 7 6 2 1/);

my $length = $#array;

my $i;
for ( $i = 0; $i < $length; $i++ ){
  if( $array[$i] > 5 ){
    last;
  }
}

if ( $i < $length ){
  print "Item $i : $array[$i]\n";
} else {
  print "Not found\n";
}

