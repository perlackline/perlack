#!/usr/bin/perl

#use strict;
#use warnings;

use Test::More tests => 4;

ok( 1, '1 is true' );

is( 2 + 2, 4, 'The sum is 4' );

is( 2 * 3, 5, 'The product is 5' );

isnt( 2 ** 3, 6, "The result isn't 6" );

like( 'Alpaca Book', qr/alpaca/i, 'I found an alpaca!' );

