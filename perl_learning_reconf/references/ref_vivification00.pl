#!/usr/bin/perl

use strict;
use warnings;

my $not_yet;
#@{$not_yet} = (qw/one two three/);
$not_yet = [qw/one two three/];

print @{$not_yet}, "\n";

$not_yet = { key1 => 'val1', key2 => 'val2' };

print map { "$_\n" } keys %{$not_yet}; 

#print $not_yet->[0], "\n";
#print $not_yet->[1], "\n";
#print $not_yet->[2], "\n";


