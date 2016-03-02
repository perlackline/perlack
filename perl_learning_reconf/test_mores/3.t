#!/usr/bin/perl

use strict;
use warnings;

use Test::More "no_plan";
#use Test::File;
use Test::MockObject;

my $db = Test::MockObject->new();

$db->mock(
  list_names => sub { qw( Gilligan Skipper Professor ) },
);

my @names = $db->list_names;

is( scalar @names, 3, 'Got the right number of result' );
is( $names[0], 'Gilligan', 'The first result is Gilligan' );

print "The names are : @names\n";

