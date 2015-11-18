#!/usr/bin/perl

use strict;
use warnings;

# http://stackoverflow.com/questions/6082219/perl-regex-e-eval-modifier-with-s

my $var = 'testing';
$_ = 'In this string we are $var the "e" modifier.';

s/(\$\w+)/$1/ee;

print;

print "\n";
