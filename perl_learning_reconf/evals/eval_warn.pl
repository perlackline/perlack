#!/usr/bin/perl

use strict;
use warnings;

my $x = '1';
my $y = '1; system "ls ./ > test";';
my $ans;

my $exp = '$ans = 1/1; system "ls";';
eval ($exp);

#$ans = 1/1; system "ls";

if ($@) {
  die "ERROR: $@";
} else {
  print "$ans\n";
}

