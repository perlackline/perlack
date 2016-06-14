#!/usr/bin/perl

use strict;
use warnings;
use autodie;

open my $fh, '<', 'file.txt';

chomp(my @arry =<$fh>);

print "--- before grep! ---\n";
foreach (@arry) {
  print "$_\n";
}

#my @match = grep { /hel+o/i } @arry;
my @match = grep /hel+o/i, @arry;

print "--- after grep! ---\n";
foreach (@match) {
  print "$_\n";
}

