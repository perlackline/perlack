#!/usr/bin/perl

use strict;
#use warnings;

print "please be divided by x / y.\n";
print "the dividend x: ";
chomp(my $x = <STDIN>);
print "the divisor y: ";
chomp(my $y = <STDIN>);

my $result;
eval { $result = $x / $y};

print "result: $result\n";

