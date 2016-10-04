#!/usr/bin/perl

use strict;
use warnings;

#require 'outer.txt';

#my $arg = shift;
#eval $arg;
#die $@ if $@;

print "-- first print\n";

print "-- second print\n";

sub test_unit { print "test_unit\n"; UNITCHECK{ print "test_units UNITCHECK\n" } }

UNITCHECK { print "-- UNITCHECK block\n" }

test_unit();

#CHECK { print "-- CHECK\n" }



