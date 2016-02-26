#!/usr/bin/perl

use strict;
use warnings;

package Circular;

sub new {
  my $class = shift;
  return bless { name => shift }, $class;
}

sub DESTROY {
  my $self = shift;
  print "$self->{name}: nuked\n";
}

package main;
{
  my $a = Circular->new('a');
  my $b = Circular->new('b');

use Data::Dumper;
print Dumper $a;
print Dumper $b;

$a->{next} = 'ABC';
$a->{next} = '123';

print "--- ---\n";

$a->{next} = $b;
$b->{next} = $a;

print Dumper $a;
print Dumper $b;



}

print "the end\n";

