#!/usr/bin/perl

use strict;
use warnings;

our $shucks;
sub catch_zap{
  my $signame = shift;
  $shucks++;
  die "\nSomebody sent me a SIG$signame";
}

$SIG{'INT'} = __PACKAGE__ . '::catch_zap'; 


my $count = 0;
while (1) {
  print "$count\n";
  $count++;
  sleep 1;
}

print "Escaped the while loop\n";
