#!/usr/bin/perl

use strict;
use warnings;

print "please be divided by x / y.\n";
print "the dividend x: ";
chomp(my $x = <STDIN>);
print "the divisor y: ";
chomp(my $y = <STDIN>);

my $result;

if ( $y == 0 ) { 
  eval { die "division by zero!\n" }
} else {
  $result = $x / $y;
}

if ( $@ ) {
  print "ERROR: $@";
} else {
  print "result: $result\n";
}


