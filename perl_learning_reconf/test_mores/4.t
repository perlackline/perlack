#!/usr/bin/perl

use strict;
use warnings;

use Test::More "no_plan";
use Test::Minnow::RequiredItems;

my @gilligan = (
    Gilligan => [ qw(red_shirt hat lucky_socks water_bottle) ]
    #Gilligan => [ qw(preserver sunscreen jacket red_shirt hat lucky_socks water_bottle) ]
);

check_required_items_ok( @gilligan );

