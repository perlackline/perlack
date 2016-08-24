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
    my($IN,$OUT) = @$_;
    my $line;
    defined($line = <$IN>) and print $OUT $line;
  } @handlepairs;
#$DB::single=2
}

#$DB::single=1;
