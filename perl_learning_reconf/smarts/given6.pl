#!/usr/bin/perl

use 5.010001;

use strict;
use warnings;

my $fred = 'Fred';
my $false = 0;
my $pattern = 'Jon';

given ( $fred ) {
    when ( ! $false )  { say "It's false"; continue }
    when ( ! /$pattern/i )  { say 'Name is not Fred' }
    default { say 'not mucht' }
}

