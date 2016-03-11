#!/usr/bin/perl

use strict;
use warnings;

my @ref_hash = (
  {key00 => 'val00', key01 => 'val01'},
  {key10 => 'val10', key11 => 'val11'},
);

#print "$_\n" for keys %{$ref_hash[0]};
#print "$_\n" for keys %{$ref_hash[1]};

print ${$ref_hash[0]}{key00}, "\n";
print ${$ref_hash[0]}{key01}, "\n";

print ${$ref_hash[1]}{key10}, "\n";
print ${$ref_hash[1]}{key11}, "\n";

#use Data::Dumper;
#print Dumper @ref_hash;

print "-----------------\n";
my $provisions;
$provisions->{key0} = [ qw/val0 val1 lva2/ ];
map{ print "$_ : @{$provisions->{$_}}\n" } keys %{$provisions};

