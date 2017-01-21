#!/usr/bin/perl

use strict;
use warnings;

# check AUTOLOAD

package SomeClass;
sub new {
  my $class = shift;
  my $name = shift || 'Tarou';
  my $self = { Name => $name };
  bless $self, $class;
}

sub AUTOLOAD {
  our $AUTOLOAD;
  warn "The called metod '$AUTOLOAD' does not exist in The class.\n"; 
} 

package main;

my $obj = SomeClass->new;

# $B%a%=%C%I(B name $B$ODj5A$5$l$F$$$J$$(B !
print $obj->name, "\n";


#  use Carp qw(croak);
#  #croak ref($class). " does not know how to '$AUTOLOAD'";
