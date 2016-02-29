#!/usr/bin/perl

use strict;
use warnings;

#my @array = (['anon00','anon01'], ['anon10','anon11']);
my $array = [['anon00','anon01'], ['anon10','anon11']];

#print "$array[0]->[0]\n";
#print "$array[0]->[1]\n";
#print "@{$array[0]}\n";
#
#print "$array[1]->[0]\n";
#print "$array[1]->[1]\n";
#print "@{$array[1]}\n";
#
print "$array->[0]->[0]\n";
print "$array->[0]->[1]\n";
print "@{$array->[0]}\n";

print "${$array}[1]->[0]\n";
print "${$array}[1]->[1]\n";
print "@{$array->[1]}\n";

use Data::Dumper;

#print Dumper @array;
print Dumper $array;
