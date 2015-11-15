#!/usr/bin/perl

#use strict;
use warnings;

my @character = qw/ Al Bernie Chris /;

my @values = qw/ 000 111 222 /;

my %hash;
@hash{ @character } = @values;

print "$_: $hash{$_}\n" for keys %hash;

