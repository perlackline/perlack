#!/usr/bin/perl

use strict;
use warnings;

my @AoH;

my @array;
while(<>){
  push @AoH, { split /[\s+=]/ };
  #chomp;
  #@array = split /[\s+=]/;
  #print "@array\n";
}
#while( <> ){
#  my $rec = {};
#  foreach my $field ( split ){
#    my ($key,$value) = split /=/, $field;
#    $rec->{$key} = $value;
#  }
#  push @AoH, $rec;
#}

use Data::Dumper;
print Dumper \@AoH;


