#!/usr/bin/perl

use strict;
use warnings;

package Animal;
sub speak {
  my $class = shift;
  print "a $class goes ", $class->sound, "!\n";
}

package Cow;
#@Cow::ISA = qw(Animal);
#use parent -norequire, qw( Animal );
#use base  qw( Animal );
our @ISA = qw( Animal );
sub sound { "mooo" }  

package Horse;
sub speak { print "a Horse goes neigh!\n"; }

package Sheep;
sub speak { print "a Sheep goes baaah!\n"; }


package main;

Cow->speak;

