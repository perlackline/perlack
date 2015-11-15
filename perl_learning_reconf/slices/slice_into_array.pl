#!/usr/bin/perl

use strict;
use warnings;

my @arry = qw/one two three four five/;

@arry[1,3] = qw/even even/;

print "@arry\n";

#my $even = qw/ one two three four five /[1];
#print "$even\n";

