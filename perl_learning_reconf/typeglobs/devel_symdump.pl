#!/usr/bin/perl

use strict;
use warnings;

package another;

our $foo = 'another foo';
our @foo = qw/anohter foo arry/;
our %foo = (0 => 'another', 1 => 'foo', 2 => 'hash');
sub foo { print "another foo sub\n" }

package main;

require Devel::Symdump;
my @packs = qw( another);
my $obj = Devel::Symdump->new(@packs);

map { print "scalar: $_\n" } $obj->scalars;
map { print "array : $_\n" } $obj->arrays;
map { print "hash  : $_\n" } $obj->hashes;
map { print "func  : $_\n" } $obj->functions;

#foreach my $name (sort keys %another::){
#  print "[key] $name [value] $another::{$name}\n";
#}

#my $foo = 'this is main';
#our $bar = 'this is main';
#local $baz = 'this is main';

#foreach my $name (sort keys %::){
#  print "[key] $name [value] $::{$name}\n";
#}


