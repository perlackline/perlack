#!/usr/bin/perl

use strict;
use warnings;

my @args = qw(0 1 2 4 5);

map {print "$_ "} @args;
print "\n";

at_check(@args);

map {print "$_ "} @args;
print "\n";

sub at_check {
  my $alph = 'a';
  map { $_ = $alph++} @_;
}

