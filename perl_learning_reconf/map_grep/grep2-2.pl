#!/usr/bin/perl

use strict;
use warnings;


my @x = (qw(
  aaa.a
  bbb.b
  ccc.c
  eee.e
  fff.f
  ggg.g
));
my @y = (qw(
  aaa.a
  bbb.b
  ccc.c
  ggg.g

));

# http://perldoc.jp/docs/perl/5.14.1/perlfaq4.pod#How32do32I32compute32the32difference32of32two32arrays63-32How32do32I32compute32the32intersection32of32two32arrays63
# 二つの配列の差(difference)を求めるには? 二つの配列の共通要素(inter section)を求めるには?¶

my %count = ();

foreach my $element (@x, @y) { $count{$element}++ }

my @intersection = grep{
  $count{$_} < 2;
} sort keys %count;

print "-- intersecton --\n", map{ "$_\n" } @intersection;

