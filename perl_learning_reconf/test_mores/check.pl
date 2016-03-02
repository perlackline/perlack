#!/usr/bin/perl

use strict;
use warnings;

use My::List::Util;

my $array = [qw(a b c d e f)];
my $shuffled = $array;

shuffle( $shuffled );

print "shuffled: @{$shuffled}\n";
print "array   : @{$array}\n";

