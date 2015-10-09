#!/usr/bin/perl

use 5.010001;

use strict;
use warnings;

my @strings = qw/ Al Bernie Chris /;

foreach (@strings) {
    say 1 + 1;
    when ( /al/i )     { say "al $_" }
    when ( /bernie/i ) { say "bernie $_" }
    say 1 + 1;
    when ( /chris/i )  { say "chris $_" }
    default { say "hum.."}
}

