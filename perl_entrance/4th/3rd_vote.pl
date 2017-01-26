#!/usr/bin/perl

use strict;
use warnings;

my $ref1 = { name => 'A', favorite_foods => [qw/noodle rice pizza/]};
my $ref2 = { name => 'B', favorite_foods => [qw/rice pizza noodle/]};
my $ref3 = { name => 'C', favorite_foods => [qw/pasta bread pizza/]};
my $ref4 = { name => 'D', favorite_foods => [qw/pizza noodle bread/]};

my @array = ($ref1, $ref2, $ref3, $ref4);

my $rank = {};
foreach my $ref_hash (@array){
  foreach my $food (@{$ref_hash->{favorite_foods}}){
    if (defined $rank->{$food}){
      $rank->{$food}++;
    }else{
      $rank->{$food} = 1;
    }
  }
}

print "--- ranking\n";

map{ print "$rank->{$_} : $_\n"  } sort{ $rank->{$b} <=> $rank->{$a} } keys %{$rank};

