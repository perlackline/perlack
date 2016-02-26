#!/usr/bin/perl

use strict;
use warnings;

my $foo = 'foo';

my $take_val = $foo;
my $take_ref = \$foo;

print "$take_val\n";
print "$take_ref\n";

print "${$take_ref}\n";
print "$$take_ref\n";
