#!/usr/bin/perl

use strict;
use warnings;

# -- Animal --
{ package Animal;
  sub name {
    my $either= shift;
    ref $either
      ? $either->{Name}
      : "an unnamed $either";
  }
  sub named {
    my $class = shift;
    my $name = shift;
    my $self = { Name => $name, Color => $class->default_color };
    bless $self, $class;
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
  sub default_color { 'brown' }
  sub color {
    my $self = shift;
    $self->{Color};
  }
  sub set_color {
    my $self = shift;
    $self->{Color} = shift;
  }
}

# -- Horse ---
{ package Horse;
  our @ISA = qw(Animal);
  sub sound { 'neigh' }
}

# -- Sheep --
{ package Sheep;
  our @ISA = qw(Animal);
  sub sound { 'baaah' }
#  sub default_color { 'white' }
}

# --
#my $lost = bless { Name => 'Bo', Color => 'white' }, 'Horse';
#print 'say', $lost->speak, "who..\n";
#print $lost->default_color, "\n";

my $tv_horse = Horse->named('Mr. Ed');
$tv_horse->set_color('black-and-white');
print $tv_horse->name, ' is colored ', $tv_horse->color, "\n";

