#!/usr/bin/perl

use strict;
use warnings;

sub somefunc {
  my $alp = 'a';
  my $idx = shift;
  my $chr = ord($alp) + $idx;
  chr($chr) x 3;
}

my @AoA;
foreach my $i (0 .. 3){
  my @tmp  = somefunc($i);
  $AoA[$i] = [ @tmp ];
}

foreach my $aref ( @AoA ){
  print "\t [ @{$aref} ]\n";
}

#my $a = 'a';
#my $chr = ord($a) - 1;
#print chr($chr),"\n";

use Data::Dumper;
print Dumper @AoA;

