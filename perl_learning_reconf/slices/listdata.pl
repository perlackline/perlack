#!/usr/bin/perl

use strict;
use warnings;

my @even = (split /:/, 'one:two:three:four:five')[1, 3];
print "@even\n";

#my $even = qw/ one two three four five /[1];
#print "$even\n";

