#!/usr/bin/perl

use strict;
use warnings;

use Test::More "no_plan";
#use Test::File;
use Test::Output;

sub hello { print "Welcome Aboard!\n" }
#sub print_hello { print STDOUT "Welcome Aboard!\n" }
sub print_error { print STDERR "There's a hole in the ship!\n" }

stdout_is( \&hello, "Welcome Aboard!\n" );

stderr_like( \&print_error, qr/ship/ );

#file_exists_ok( 'check.pl' );

# ok(!-e 'check.pl');

