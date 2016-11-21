#!/usr/bin/perl

use strict;
use warnings;

package Cow;
sub speak { 
  my $arg_first = shift || 'default';
  print "a Cow goes mooo!\n";
  print "\$first arg: $arg_first\n";
}

package Horse;
sub speak { print "a Horse goes neigh!\n"; }

package Sheep;
sub speak { print "a Sheep goes baaah!\n"; }


package main;

#no strict 'refs';
my @pasture = qw(Cow Horse Sheep);
foreach my $beast (@pasture) {
  $beast->speak;(
  #&{$beast."::speak"};
}
