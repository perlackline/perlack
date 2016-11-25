#!/usr/bin/perl

use strict;
use warnings;

package Klass;
sub new {
  my $class = shift;
  bless { attr => 'super' }, $class;
}
sub accessor {
  my $self = shift;
  $self->{attr} = shift if @_;
  $self->{attr}; 
}

package Child;
our @ISA = qw( Klass );
sub get_attr {
  my $self = shift;
  $self->{attr} = 'sub';
  $self->{attr};
}

package GrandChild;
our @ISA = qw{ Child };
sub get_attr {
  my $self = shift;
  $self->{attr} = 'grand child';
  $self->{attr};
}

package main;

my $parent = Klass->new;
my $child = Child->new;
my $gchild = GrandChild->new;

print "--- methods ---\n";
print $parent->accessor, "\n";
print $child->get_attr, "\n";
print $gchild->get_attr, "\n";

print "--- ref() ---\n";
print "ref (parent): ", ref($parent), "\n";
print "ref (child): ", ref($child), "\n";
print "ref: (gchild): ", ref($gchild), "\n";

print "--- isa ---\n";
print "child isa Klass?: ", $child->isa('Klass'), "\n";
print "Child isa Klass?: ", Child->isa('Klass'), "\n";
print "Grandchild isa Klass?: ", GrandChild->isa('Klass'), "\n";
print "Klass is a UNIVERSAL?: ", Klass->isa('UNIVERSAL'), "\n"; 
print "Klass is a Klass?: ", Klass->isa('Klass'), "\n"; 

print "--- isa-2 ---\n";
print $parent->isa('Klass'), "\n";
print $child->isa('Klass'), "\n";
print $gchild->isa('Klass'), "\n";
print $gchild->isa('Child'), "\n";

if ( $parent->isa('Others') ){
  print "prenat isa Others\n";
} else {
  print "prenat isa not Others\n";
}



