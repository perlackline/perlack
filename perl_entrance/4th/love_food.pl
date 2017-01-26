#!/usr/bin/perl

use strict;
use warnings;

my $words_ref = [
    'alice loves meat!',
    'bob loves sushi!',
];

love_food($words_ref);

sub love_food {
  my $ref_ary = shift; 
  foreach my $str ( @{$ref_ary} ){
    if ( $str =~ /(.+) loves (.+)!/) {
      print "$1 -> $2\n";
    }else{
      print "No match..\n";
    }
  }
}

