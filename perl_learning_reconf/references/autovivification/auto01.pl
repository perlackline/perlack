#!/usr/bin/perl

use strict;
use warnings;

my $provisions;
my $person;

$person = 'Block';

#${$provisions}{$person} = 'gear';
#$provisions->{key0} = 'value0';
push @{$provisions->{key0}}, qw/value0 value1 value2/;

print "$_ : @{$provisions->{$_}}\n" for keys %{$provisions};

use Data::Dumper;
print Dumper $provisions;

