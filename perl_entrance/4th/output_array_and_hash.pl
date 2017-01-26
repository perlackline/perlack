#!/usr/bin/perl

use strict;
use warnings;

my $hash = { key1 => 'val1', key2 => 'val2' };
my $arry = [ qw/elm1 elm2 elm3/ ];

sub output_array_and_hash {
  my $ary = shift;
  my $hsh = shift;
  foreach my $elm (@{$ary}){
    print "$elm\n";
  }
  foreach my $key (keys %{$hsh}){
    print "$key: $hsh->{$key}\n";
  }
}

output_array_and_hash($arry,$hash);
