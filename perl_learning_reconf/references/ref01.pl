#!/usr/bin/perl

use strict;
use warnings;

my $val = "hello";

my $ref = \$val;

print "$ref\n";

print "${$ref}\n";
