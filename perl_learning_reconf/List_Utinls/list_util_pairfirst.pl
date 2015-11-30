#!/usr/bin/perl

use strict;
use warnings;

use List::Util qw(pairfirst pairgrep pairvalues pairkeys pairs unpairs);

my @kvlist = qw(one 1 TWO 2 THREE 3);

my ($key, $value)  = pairfirst { $a =~ /[[:upper:]]+/ } @kvlist;
#my @subset = pairgrep { $a =~ /^[[:upper:]]+$/ } @kvlist;
#my $scalar  = pairfirst { $a =~ /[[:upper:]]+/ } @kvlist;
my $scalar  = pairfirst { $a =~ /four/ } @kvlist;

map { print "\@subset: $_\n" } $key, $value;
#map { print "\@kvlist: $_\n" } @kvlist;
if (defined $scalar) {
  print "\$scalar: $scalar\n";
}else{
  print "\$scalar: undef\n";
}

