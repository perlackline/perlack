#!/usr/bin/perl

use strict;
use warnings;

use List::MoreUtils ':all';

# ?

my @list = qw(A B 0);

my @empty0 = any @list;
my @empty1 = all @list;

map { print "\@empty0: $_\n" } @empty0;
map { print "\@empty1: $_\n" } @empty1;

