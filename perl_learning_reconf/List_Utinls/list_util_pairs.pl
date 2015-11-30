#!/usr/bin/perl

use strict;
use warnings;

use List::Util qw(pairs);

my @kvlist = qw(one 1 tow 2 three 3);

my @pairs = pairs @kvlist;

map { print "$$_[0] : $$_[1]\n" } @pairs;

$pairs[0][0] = 'change';

map { print "$$_[0] : $$_[1]\n" } @pairs;

print "$kvlist[0]\n";

