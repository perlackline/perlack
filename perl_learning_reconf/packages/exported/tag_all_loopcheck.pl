#!/usr/bin/perl

use strict;
use warnings;

my %hash = (key1 => [qw(val1 val2)], key2 => [qw(val3 val4)]);

my %seen;
push @{$hash{all}},
  grep {!$seen{$_}++} @{$hash{$_}} for keys %hash;

print "$_ : $seen{$_}\n" for keys %seen;
#use Data::Dumper;
#print Dumper(\%hash);

