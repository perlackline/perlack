#!/usr/bin/perl

use strict;
use warnings;

use List::Util qw(pairs unpairs);

my @kvlist = qw(one 1 two 2 three 3);

#@kvlist = unpairs grep { $$_[0] =~ /o/ } pairs @kvlist;
#@kvlist = unpairs grep { $$_[1] > 1 } pairs @kvlist;
#@kvlist = unpairs grep { $_->key =~ /three/ } pairs @kvlist;

#@kvlist = unpairs map { $$_[0] .= '-map'; ++$$_[1]; $_ } pairs @kvlist;

@kvlist = unpairs sort { $a->key cmp $b->key } pairs @kvlist;

map { print "unpairs: $_\n" } @kvlist;

