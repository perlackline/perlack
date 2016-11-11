#!/usr/bin/perl

use strict;
use warnings;

package Klass;

my %default = ( name => 'anonymous' );
sub new {
  my $thing = shift;
  my $class = ref $thing || $thing;
  #my $class = shift;
  my $self  = { %default, @_ };
  bless $self, $class;
}

package main;

my $obj = Klass->new( name => 'Fred' );
my $obj2 = $obj->new;

my $ref_hash = { key => 'value' };

use Scalar::Util qw( reftype );
print "reftype: ", reftype($obj), "\n";
print $obj, "\n";

print ref($ref_hash), "\n";
print $ref_hash, "\n";

use Data::Dumper;
print Dumper $obj;
print Dumper $obj2;

