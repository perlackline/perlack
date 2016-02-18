#!/usr/bin/perl

#use strict;
#use warnings;

use Test::More "no_plan";   # 開発中
#use Test::More tests => 4;

ok(1 + 2 == 3, '1 + 2 == 3');
ok(2 * 4 == 8, '2 * 4 == 8');
my $divide = 5 / 3;
ok(abs($divide - 1.666667) < 0.001, '5 / 3 == (approx) 1.666667');
my $subtract = -3 + 3;
ok(($subtract eq '0' or $subtract eq '-0'), '-3 + 3 == 0');

