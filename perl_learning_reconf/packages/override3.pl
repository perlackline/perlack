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

sub new {
  my $class = shift;
  my $name = shift;
  my $self = $class->SUPER::new($name);

  # adding attr
  $self->{horse_color} = shift || 'brown';

  # retunr object
  $self;
}

# カラーへのアクセサ
sub color {
  my $self = shift;
  $self->{horse_color} = shift if @_;
  $self->name, "'s color is ", $self->{horse_color};
}

sub sound { 'neigh' }
sub speak {
  my $self = shift;
  $self->SUPER::speak;
  print "adding message.\n";
}

package main;

#my $horse = Horse->new('Child', 'Black');
my $horse = Horse->new('Child');

print "horse color: ", $horse->color, "\n";

$horse->color('blue');

print "new_color  : ", $horse->color, "\n";

