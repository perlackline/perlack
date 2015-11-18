#!/usr/bin/perl

use strict;
use warnings;

my $exp = '5 + 8';

$exp =~ s/(.*)/$1/ee;

print $exp, "\n";

