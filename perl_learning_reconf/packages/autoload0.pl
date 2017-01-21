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

# $B%3%s%9%H%i%/%?0J30$N%a%=%C%I$O$^$@$J$$(B ...

package main;

my $obj = SomeClass->new;

# $B%a%=%C%I(B name $B$ODj5A$5$l$F$$$J$$(B !
print $obj->name, "\n";

