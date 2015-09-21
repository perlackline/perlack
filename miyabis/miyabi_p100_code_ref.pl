#!/usr/bin/perl

use strict;
use warnings;
use feature 'say';

sub jojo_name {
  my $name = shift;

  # クロージャ
  my $code_ref = sub {
    my $args = shift;
    say "$name, $args";
  };

  return $code_ref;
}

my $jonathan = jojo_name('jonathan');
my $joseph   = jojo_name('joseph');

$jonathan->('hamon');
$joseph->('stand');

