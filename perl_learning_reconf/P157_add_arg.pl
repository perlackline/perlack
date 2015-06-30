#!/usr/bin/perl

use strict;
use warnings;

{ package Animal;
  sub named {
    my $class = shift;
    my $name = shift;
    bless \$name, $class;
  }
  sub name {
    my $either= shift;
    ref $either
      ? $$either            # インスタンスなので名前を返す
      : "an unnamed $either"; # クラスなので汎用の値を返す
    #$$self;
  }
  sub speak {
    my $either = shift;
    print $either->name, ' goes ', $either->sound, "\n";
  }
  sub eat {
    my $either = shift;
    my $food = shift;
    print $either->name, " eats $food.\n";
  }
}
{ package Horse;
  our @ISA = qw(Animal);
  sub sound { 'neigh' }
}
{ package Sheep;
  our @ISA = qw(Animal);
  sub sound { 'baaah' }
}

my $tv_horse = Horse->named('Mr. Ed');
$tv_horse->eat('hay');
Sheep->eat('grass');

print Animal->name, "\n";
