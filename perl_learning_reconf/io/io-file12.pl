#!/usr/bin/perl

use strict;
use warnings;

use IO::File;

my @handlepairs;
foreach my $file (glob( '*.in')){
  (my $out = $file) =~ s/\.in/.out/;
  push @handlepairs, [
      (IO::File->new("< $file") or die "$!"),
      (IO::File->new("> $out") or die "$!"),
  ];
}

while (@handlepairs){
  @handlepairs = grep {
    #if (defined(my @line = $_->[0]->getline)){
    if (my $line = $_->[0]->getline){
    #if (my @lines = $_->[0]->getlines){
      $_->[1]->print($line);
    }else{
      0;
    }
  } @handlepairs;
#$DB::single=2
}

#$DB::single=1;
