#!/usr/bin/perl

use strict;
use warnings;

package Animal;

# コンストラクタ
#sub named {
sub new {
  my $class = shift;
  my $name = shift;
  #bless \$name, $class;
  my $self = { Name => $name, Color => 'white' }; 
  bless $self, $class;
}

# color getter
sub color {
  $_[0]->{Color};
}
# color setter
sub set_color {
  $_[0]->{Color} = $_[1];
}
sub speak {
  my $either = shift;
  print $either->name, " goes ", $either->sound, "!\n";
}
sub name {
  my $either = shift;
  ref $either ? $either->{Name} : $either;
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

Cow->speak;
my $named_cow = Cow->new("Tarou");
$named_cow->speak;

print $named_cow->{Color}, "\n";
$named_cow->set_color('black');
print $named_cow->color, "\n";

use Data::Dumper;
print Dumper $named_cow;
