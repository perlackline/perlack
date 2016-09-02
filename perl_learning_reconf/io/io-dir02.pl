#!/usr/bin/perl

use 5.012; # so readdir assigns to $_ in a lone while test
use strict;
use warnings;

my $dirname = 'io-dirs';
opendir(my $dh, $dirname) or die "$!";

while(readdir $dh){
  print "$dirname/$_\n";
  print "---\n";
  print telldir $dh, "\n";
}

