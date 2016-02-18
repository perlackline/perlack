#!/usr/bin/perl

#use strict;
#use warnings;

use Test::More tests => 6;

is( sqrt(  0),  0, 'The square root of 0   is  0' );
is( sqrt(  1),  1, 'The square root of 1   is  1' );
is( sqrt( 49),  7, 'The square root of 49  is  7' );
is( sqrt(100), 10, 'The square root of 100 is 10' );

is( sqrt(0.25), 0.5, 'The square root of 0.25 is 0.5' );

my $product = sqrt(7) * sqrt(7);

ok( $product > 6.999 && $product < 7.001,
    "The product [$product] is around 7" );

