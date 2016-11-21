#!/usr/bin/perl

use strict;
use warnings;

package Animal;
sub speak {
  my $class = shift;
  print "a $class goes ", $class->sound, "!\n";
}

package Cow;
our @ISA = qw( Animal );
sub sound { "mooo" }  

package Horse;
our @ISA = qw( Animal );
sub sound { "neigh" }  

package Sheep;
our @ISA = qw( Animal );
sub sound { "baaah" }  


package main;

my @pasture = qw( Cow Horse Sheep );
foreach my $animal ( @pasture ){
  $animal->speak;
}


