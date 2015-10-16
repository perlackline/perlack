#!/usr/bin/perl

use strict;
use warnings;

print "==================================\n";
print "Please enter something.\n";
print "Press enter when you are finished.\n";
print "==================================\n";
my @val;
while (<STDIN>) {
  last if /\A\n\z/;
  chomp;
  push @val, $_;
}

print "$_\n" for @val;

