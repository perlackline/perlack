#!/usr/bin/perl

use strict;
use warnings;

my @e = qw( xs script pod PL support);
my ($i) = grep {$e[$_] eq 'pod'} 0..$#e;
my @i = grep {$e[$_] eq 'pod'} 0..$#e;
my $h = grep {$e[$_] eq 'pod'} 0..$#e;

print "i: $i\n";
print "(a)i: @i\n";
print "h: $h\n";

print "e: @e\n";
unshift @e,splice @e,$i,1;

print "e: @e\n";
