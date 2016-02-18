#!/usr/bin/perl

use strict;
use warnings;

sub foo {
    local *g = shift;
    print "${*g} \n";
    print "@{*g} \n";
}

our $a = 1;
our @a = (10, 20, 30);
foo(*a);

