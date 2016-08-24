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
$DB::single=2;
  @handlepairs = grep {
    if (defined(my $line = $_->[0]->getline)){
      $_->[1]->print($line);
    }else{
      0;
    }
  } @handlepairs;
}

$DB::single=2
