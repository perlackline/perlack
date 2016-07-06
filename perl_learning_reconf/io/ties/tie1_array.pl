#!/usr/bin/perl

use strict;
use warnings;

use Tie::CharArray;
my $foobar = 'a string';
tie my @foo, 'Tie::CharArray', $foobar;

foreach my $i (0..$#foo){
  print "$i : $foo[$i]\n";
}
