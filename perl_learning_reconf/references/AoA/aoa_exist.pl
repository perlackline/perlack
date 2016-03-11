#!/usr/bin/perl

use strict;
use warnings;

my @AoA = ( [qw/abc def/],[qw/123 456/] );

use Data::Dumper;
print Dumper \@AoA;

push @{ $AoA[0] }, 'ABC', 'DEF';
print "--- after ---\n";
print Dumper \@AoA;

