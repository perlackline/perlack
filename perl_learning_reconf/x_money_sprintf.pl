#!/usr/bin/perl

use strict;
use warnings;

my $num = -9999999999999.12345678;

print &big_money($num), "\n";

sub big_money {
  my $money = sprintf "%.2f", shift @_;
  1 while $money =~ s/^(-?\d+)(\d\d\d)/$1,$2/;
  $money =~ s/^(-?)/$1\$/;
  $money;
}
