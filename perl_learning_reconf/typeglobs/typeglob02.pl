#!/usr/bin/perl

use strict;
use warnings;

package another;

our $foo = 'foo';
our @foo = (1, 2, 3);
our %foo = (yes => 0, no => 1);
sub foo { print "This sub foo in aonother\n"; }

our $bar = 'bar';
our @bar = (4, 5, 6);
our %bar = (0 => 'yes', 1 => 'no');
sub bar { print "This sub bar in aonother\n"; }

package main;

foreach my $key (sort keys %another::){
  print "[key] $key [value] $another::{$key}\n";
}

