#!/usr/bin/env perl

use strict;
use warnings;

#print
# $_ % 15 ?
#  $_ % 5 ?
#    $_ % 3 ? "$_\n"
#      :"Fizz\n"
#      :"Buzz\n"
#      :"FizzBuzz\n" for( 1 .. 45 );

# Useless use of constant ....
# in void context at .. Error ...
for (1 .. 45) {
print
 ($_ % 15) == 0 ? "FizzBuzz\n" :
 ($_ % 5)  == 0 ? "Buzz\n"     :
 ($_ % 3)  == 0 ? "Fizz\n"     :
           "$_\n";
}

#for my $num (1..45) {
#  unless ( $num % 15 ) {
#    print "FizzBuzz: $num\n";
#    next;
#  }
#  unless ( $num % 5 ) {
#    print "Buzz: $num\n";
#  }
#  unless ( $num % 3 ) {
#    print "Fizz: $num\n";
#  }
#
#}
