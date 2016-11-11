#!/usr/bin/perl

use strict;
use warnings;

package Klass;

my %default = ( name => 'anonymous' );
sub new {
  #my $class = shift;
  #bless { %default, @_ }, $class;
  bless { %default, @_ };
}
#sub new {
#  my $class = shift;
#  my $self = { @_ };
#  bless $self, $class;
#  $self->initialize();
#  return $self; 
#}
#sub initialize {
#  my $self= shift;
#  $self->{name} = 'anonymous';
#  $self->{height} = 0;
#  $self->{weight} = 0;
#}

package main;

my $obj = Klass->new();
#my $obj = Klass->new( sex => 'male' );
#my $obj = Klass->new( name => 'Fred', sex => 'male' );
#my $obj = Klass->new( name => 'Fred', height => 180, weight => 80  );

print "---\n";
use Data::Dumper;
print Dumper $obj;
print $obj, "\n";

