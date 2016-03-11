#!/usr/bin/perl

use strict;
use warnings;

my @AoA = ( [qw/abc def/],[qw/123 456/] );

for my $i ( 0..$#AoA){
  #print "@{$AoA[$i]}\n";
  #print "@ @{$AoA[$i]}\n";
  for my $j ( 0..$#{ $AoA[$i] } ){
    #print "elt $i $j is $AoA[$i]->[$j]\n";
    print "elt $i $j is ${$AoA[$i]}[$j]\n";
  }
}

