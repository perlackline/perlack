#!/usr/bin/perl

use strict;
use warnings;

print "please be divided by x / y.\n";
print "the dividend x: ";
chomp(my $x = <STDIN>);
print "the divisor y: ";
chomp(my $y = <STDIN>);

my $result = defined eval { $x / $y } ? ($x / $y) : 'NaN';
#use 5.010;
#my $result = eval { $x / $y } // 'NaN';

print "result: $result\n";

print "\$\@: $@" if $@; 

