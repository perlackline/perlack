#!/usr/bin/perl

use strict;
use warnings;

my @ary = (1, 2, 3);
print "@ary\n";
my $ref = \@ary;
print "$ref\n";

change_ary($ref);

sub change_ary {
  my $ref_sub = shift @_;
  print "$ref_sub\n";
  push @{$ref_sub}, 'a';
}

print "@ary\n";
$ref = 'a';
print "$ref\n";

