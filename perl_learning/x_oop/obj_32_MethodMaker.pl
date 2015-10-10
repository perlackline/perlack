#!/usr/bin/perl

use strict;
use warnings;

# P191
# もっと簡単にゲッターとセッターを作る

# hmm...

{ package Animal;
use Class::MethodMaker
  new_with_init => 'new',
  get_set => [-eiffel => [qw(color height name age)]],
  abstract => [qw(sound)],
;
sub init {
  my $self = shift;
  $self->set_color($self->default_color);
}
sub named {
  my $self = shift->new;
  $self->generic_name(shift);
  $self;
}
sub default_color {
  'brown';
}

sub name {
  my $self = shift;
  $self;
}

sub set_color {
  my $self = shift;
  $self->{Color} = shift;
  $self;
}
sub generic_name {
  my $either = shift;
  ref $either ? $either->name : "an unnamed $either";
}
sub speak {
  my $either = shift;
  print $either->generic_name, ' goes ', $either->sound, "\n";
}
sub eat {
  my $either = shift;
  my $food = shift;
  print $either->generic_name, " eats $food\n";
}
}

{ package Horse;
our @ISA = qw(Animal);
}

# =====================================--
# (color, height, name, age) setter
# init                       setter
# named                      setter
# speak                      getter
# eat                        set, getter ?
# default_color              setter

# set_color                  setter

use Data::Dumper;

print "\n---\n";

my $obj = Horse->named('Bow');

$obj->eat('hey');
print $obj->name, "\n";

print "---\n\n";

print "End of program.\n";

