#!/usr/bin/perl

use strict;
use warnings;

my @AoA;
while(<>){
  chomp;
  push @AoA, [ split ];
}

print "@AoA\n";

#foreach my $aref ( @AoA ){
#  print "\t [ @{$aref} ]\n";
#}

use Data::Dumper;
print Dumper \@AoA;

