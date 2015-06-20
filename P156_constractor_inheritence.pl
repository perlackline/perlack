#!/usr/bin/perl

use strict;
use warnings;

{ package Animal;
  sub speak {
    my $class = shift;
    print "a $class goes ", $class->sound, "!\n";
  }
  sub name {
    my $self = shift;
    $$self;
  }
  sub named {
    my $class = shift;
    my $name = shift;
    bless \$name, $class;
  }
}
{ package Horse;
  our @ISA = qw(Animal);
  sub sound { 'neigh' }
}

my $tv_horse = Horse->named('Mr. Ed');
$tv_horse->speak;

