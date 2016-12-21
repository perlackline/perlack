#!/usr/bin/perl

use strict;
use warnings;

# check destroy
# create temp file..

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
  print $either->name, ' goes ', $either->sound, "\n";
}

# デストラクタ
sub DESTROY {
  my $self = shift;
  warn '[', $self->name, " has died.]\n";
}

package Horse;
our @ISA = qw(Animal);
sub sound { 'neigh' }

package main;

my $horse = Horse->new;
$horse->speak;

