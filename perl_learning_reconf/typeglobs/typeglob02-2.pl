#!/usr/bin/perl

use strict;
use warnings;

package another;

our $foo = 'another foo';
our @foo = qw/anohter foo arry/;
our %foo = (0 => 'another', 1 => 'foo', 2 => 'hash');

package main;

foreach my $name (sort keys %another::){
  print "[key] $name [value] $another::{$name}\n";
}

#my $foo = 'this is main';
#our $bar = 'this is main';
#local $baz = 'this is main';

#foreach my $name (sort keys %::){
#  print "[key] $name [value] $::{$name}\n";
#}


