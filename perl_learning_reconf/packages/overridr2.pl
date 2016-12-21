#!/usr/bin/perl

use strict;
use warnings;

# check override

package Animal;

# コンストラクタ
sub new {
  my $class = shift;
  my $name = shift || 'Tarou';
  my $self = { Name => $name };

  bless $self, $class;
}

# 名前のアクセサ
sub name {
  my $either = shift;
  ref $either ? $either->{Name} : "an unnamed $either";
}
sub speak {
  my $either = shift;
  print "In the ", ref $either, "! ", $either->name, ' goes ', $either->sound, "\n";
}

sub sound { 'hummm...' }

# デストラクタ
sub DESTROY {
  my $self = shift;
  warn '[', $self->name, " has died.]\n";
}

package Horse;
our @ISA = qw(Animal);
sub sound { 'neigh' }
sub speak {
  my $self = shift;
  $self->SUPER::speak;
  print "adding message.\n";
}
sub super_speak {
  my $self = shift;
  $self->SUPER::speak;
}
  

package main;

my $animal = Animal->new('Parent');
my $horse = Horse->new('Child');

print "Animals speak: ";
$animal->speak;
print "Horses speak : ";
$horse->speak;


