#!/usr/bin/perl

use strict;
use warnings;
use utf8;
use Encode;

my @array = qw/ONE TWO THREE FOUR FIVE/;

my @hashes;
#%hash = map +(lc($_) => 1), @array;
@hashes = map +{ lc($_) => 1 }, @array;

#print @hashes, "\n";
#map { for my $key (keys%{$_}) { print "$key : $_->{$key}\n" } } @hashes;

foreach my $ref (@hashes) {
  foreach my $key (keys %{$ref}) {
    print "$key : $ref->{$key}\n";
  }
}

#foreach my $index ( 0..$#hashes ) {
#  foreach ( keys %{$hashes[$index]} ) {
#    print "$_: $hashes[$index]->{$_}\n";
#  }
#}




#foreach ( 0..$#hashes ) {
#  print %{$hashes[$_]},"\n";
#}

#use Data::Dumper;
#print Dumper @hashes, "\n";

