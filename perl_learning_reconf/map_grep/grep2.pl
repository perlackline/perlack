#!/usr/bin/perl

use strict;
use warnings;

my @x = (qw(good-evening good-morning));
my @y = (qw(good-morning good-afternoon good-evening good-night));

# http://perldoc.jp/docs/perl/5.14.1/perlfaq4.pod#How32do32I32compute32the32difference32of32two32arrays63-32How32do32I32compute32the32intersection32of32two32arrays63
# 二つの配列の差(difference)を求めるには? 二つの配列の共通要素(inter section)を求めるには?¶

my @union = my @intersection = my @difference = ();
my %count = ();

foreach my $element (@x, @y) { $count{$element}++ }

foreach my $key (keys %count){
  print "$key: $count{$key}\n";
}

print "---\n";
foreach my $element (keys %count){
  push @union, $element;
  push @{ $count{$element} > 1 ? \@intersection : \@difference }, $element;
}

print "union:\n", map{ "$_\n" } @union;
print "---\n";
print "intersecton\n", map{ "$_\n" } @intersection;
print "---\n";
print "difference\n", map{ "$_\n" } @difference;
