#!/usr/bin/perl

#use strict;
#use warnings;

my $divide = 5 / 3;

print "$divide\n";
print abs($divide), "\n";
print abs($divide - 1.666667), "\n";
print "----\n";

use Test::More "no_plan";   # 開発中
#use Test::More tests => 4;

cmp_ok(abs($divide - 1.666667), '<', 0.001,
    '5 / 3 should be (approx) 1.666667');

my $subtract = -3 + 3;
like($subtract, qr/^-?0$/, '-3 + 3 == 0');


