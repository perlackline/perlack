#!/usr/bin/perl

use strict;
use warnings;

package Animal;

# コンストラクタ
sub named {
  my $class = shift;
  my $name = shift || $class;;
  bless \$name, $class;
}

sub speak {
  my $either = shift;
  print $either->name, " goes ", $either->sound, "!\n";
}
sub name {
  my $either = shift;
  ref $either ? $$either : $either;
}

sub eat {
  my $either = shift;
  my $food = shift || 'any foods';
  print $either->name, " eats $food.\n";
}

package Cow;
our @ISA = qw( Animal );
sub sound { "mooo" }  

package Horse;
our @ISA = qw( Animal );
sub sound { "neigh" }  

package Sheep;
our @ISA = qw( Animal );
sub sound { "baaah" }  


package main;

my $named_cow = Cow->named;
#my $named_cow = Cow->named("Tarou");
$named_cow->speak;

my $named_horse = Horse->named("Jirou");
$named_horse->speak;

my $named_sheep = Sheep->named("Saburou");
$named_sheep->speak;

$named_sheep->eat('grass');
$named_sheep->eat();


