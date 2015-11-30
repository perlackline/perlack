#!/usr/bin/perl

use strict;
use warnings;

use List::Util qw(pairs unpairs);

my @kvlist = qw(one 1 tow 2 three 3);

my @pairs = pairs @kvlist;

map { print "pairs: $$_[0] : $$_[1]\n" } @pairs;

my @unpairs = unpairs @pairs;

map { print "unpairs: $_\n" } @unpairs;

