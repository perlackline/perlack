#!/usr/bin/perl

use strict;
use warnings;

# check destroy

package Animal;
sub new {
  my $class = shift;
  my $name = shift || 'Tarou';
  bless { Name => $name }, $class;
}

sub name {
  my $either = shift;
  ref $either ? $either->{Name} : "an unnamed $either";
}

sub DESTROY {
  my $self = shift;
  warn '[', $self->name, " has died.]\n";
}

package Cow;
our @ISA = qw(Animal);

package Barn;
sub new { bless [], shift }
sub add { push @{+shift}, shift }
sub contents { @{+shift} }
sub DESTROY {
  my $self = shift;
  print "$self is being destroyed...\n";
  foreach ($self->contents) {
    print ' ', $_->name, " goes homeless.\n";
  }
}

package main;

my $barn = Barn->new;
#my @cows = (Cow->new('Bessie'), Cow->new('Gwen')); 
#$barn->add($_) for @cows;
$barn->add(Cow->new('Bessie'));
$barn->add(Cow->new('Gwen'));

print "Burn the barn:\n";
$barn = undef;
#print "Lose the cows:\n";
#@cows = ( );
print "End of program.\n";

