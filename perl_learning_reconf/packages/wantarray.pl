#!/usr/bin/perl

use strict;
use warnings;

# chacking wantarray

package Context;

sub new {
  my $class = shift;
  my @ary = qw(one two three);
  bless \@ary, $class;
}

sub context {
  my $self = shift;
  return wantarray ? @{ $self } : "@{ $self }";
}

package main;

my $obj = Context->new;
print $obj->context(), "\n";
print $obj->context(). "\n";

