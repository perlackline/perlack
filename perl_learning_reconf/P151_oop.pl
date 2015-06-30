#!/usr/bin/perl

use strict;
use warnings;

{ package Animal;
  sub speak {
    my $class = shift;
    print "a $class goes ", $class->sound, "!\n";
  }
}
{ package Horse;
  our @ISA = qw(Animal);
  sub sound { 'neigh' }
}

print Horse->speak;


