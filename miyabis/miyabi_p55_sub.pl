#!/usr/bin/perl

package Morioucho;
use strict;
use warnings;
use feature 'say';

sub stand {
  my $stand_ref = shift;
  my %args = %$stand_ref;
  say "morioucho: $args{name} $args{stand} $args{height} $args{weight}";
}

package main;
sub stand {
  my $stand_ref = shift;
  my %args = %$stand_ref;
  say "main: $args{name} $args{stand} $args{height} $args{weight}";
}

Morioucho::stand ({
  name => 'jotaro',
  stand => 'star platinum',
  height => 195,
  weight => 82,
});

