#!/usr/bin/perl

use strict;
use warnings;

my $ref_arry;
$ref_arry->[0] = 'data1';
$ref_arry->[2] = 'data3';
print $ref_arry->[0], "\n";
print $ref_arry->[1], "\n";
print $ref_arry->[2], "\n";

use Data::Dumper;
print Dumper $ref_arry, "\n";

my $ref_hash;
$ref_hash->{key1} = 'val1';
$ref_hash->{key3} = 'val3';

print $ref_hash->{key1}, "\n";
print $ref_hash->{key3}, "\n";

print Dumper $ref_hash, "\n";

#my @array;
#$array[3]->{foo}->[0] = "January";

