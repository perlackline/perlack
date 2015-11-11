#!/usr/bin/perl

use strict;
use warnings;

{
my $count;
sub counter {
  #my $count;
  return ++$count;
}
}

foreach (0..4){
#for (my $i = 0; $i < 5; $i++) {
  print "$_: ", counter(), "\n";
  ++$count;
}

