#!/usr/bin/perl

use 5.010001;
use strict;
use warnings;

my %hash = (
    Alfred    => 0,
    Bernard   => 1,
    Christina => 2,
);

my $pattern = 'Alfred';

say "I found a key matching $pattern" if %hash ~~ /$pattern/;

my @array_1 = qw/ Al Bernie Chris /;
my @array_2 = qw/ Al Bernie Chris /;

say "The arrays have the same elements!" if @array_1 ~~ @array_2;

