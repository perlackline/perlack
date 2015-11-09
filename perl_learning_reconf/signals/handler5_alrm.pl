#!/usr/bin/perl

use strict;
use warnings;

eval {
  print "inner the eval\n";
  die "die in the eval\n";
};

print "outside the eval\n";

print "\$\@: $@";

