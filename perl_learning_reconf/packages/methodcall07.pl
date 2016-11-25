#!/usr/bin/perl

use strict;
use warnings;

package Animal;
our $VERSION = '0.1.0';
# コンストラクタ
#sub named {
sub new {
  my $class = shift;
  my $name = shift || 'Tarou';
  #bless \$name, $class;
  my $self = { Name => $name, Color => 'white' }; 
  bless $self, $class;
}

sub color {
  my $self = shift;
  $self->{Color} = shift if @_;
  $self->{Color};
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
our $VERSION = '1.0.0';
sub sound { "mooo" }  

package Horse;
our @ISA = qw( Animal );
sub sound { "neigh" }  

package main;

my $cow = Cow->new;
print $cow->color. "\n";
print "name: ". $cow->name. "\n";
$cow->color('black');
print $cow->color. "\n";

if ( $cow->can('color') ){
  print "cow can colors.\n";
} else {
  print "cow cannot color.\n";
}
#print &$cow->can('color'). "\n";
my $ref_color = $cow->can('color');

use B::Deparse;
my $bd = B::Deparse->new;
print $bd->coderef2text($ref_color). "\n";

print "--- ---\n";

print Cow->VERSION, "\n";
print $cow->VERSION, "\n";
print $cow->VERSION(2), "\n";


