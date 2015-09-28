#!/usr/bin/perl

use 5.010001;

use strict;
use warnings;

# --- sub routine ---
sub check_sub {
    '';
}

# --- main routine ---
my $fred = 'Fred';

given ( $fred ) {
    when ( check_sub($_) )  { say 'Name Fred' }
    default { say 'not mucht' }
}

