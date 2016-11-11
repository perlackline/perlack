#!/usr/bin/perl

use strict;
use warnings;

my $a = {};
my $b = $a;
bless $a, 'BLAH';
print "\$b is a ", ref($b), "\n";
print "\$b is a ", $b, "\n";

use Data::Dumper;
print Dumper $b;
print Dumper $a;
