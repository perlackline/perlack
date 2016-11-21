#!/usr/bin/perl

use strict;
use warnings;

#package Cow;
#our $VERSION = '0.01';
#sub speak { print "a Cow goes mooo!\n"; }

#package Horse;
#our $VERSION = '0.10';
#sub speak { print "a Horse goes neigh!\n"; }
#
#package Sheep;
#our $VERSION = '1.00';
#sub speak { print "a Sheep goes baaah!\n"; }

$Cow::VERSION = '0.01';
sub Cow::speak { print "a Cow goes mooo!\n"; }

$Horse::VERSION = '0.10';
sub Horse::speak { print "a Horse goes mooo!\n"; }

$Sheep::VERSION = '1.00';
sub Sheep::speak { print "a Sheep goes mooo!\n"; }

#package main;

our $listed = 'aaa';

Cow::speak;
print "Ver: $Cow::VERSION\n";
Horse::speak;
print "Ver: $Horse::VERSION\n";
Sheep::speak;
print "Ver: $Sheep::VERSION\n";

print "--\n";
#foreach my $name (sort keys %main::){
#  print "[key] $name [value] $::{$name}\n";
#}

