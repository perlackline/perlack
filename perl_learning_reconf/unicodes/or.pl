#!/usr/bin/perl

use strict;
use warnings;

my $num = 0;

my $ab = 0;
my $cd = 0;
my $result = 0;
#$result = $num or ($ab = 1, $cd = 2);
$result = $num or ($ab = 1, $cd = 2);

print
"
result: $result
ab    : $ab    
cd    : $cd\n";
