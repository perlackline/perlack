#!/usr/bin/perl

use strict;
use warnings;


# 数字の桁を足して奇数になる要素の値を直接取得する
# index 値ではなく, 直接要素を grep に渡す.

# 数字リスト
my @numbers = ( qw(1 2 4 8 16 32 64) );

my @odd_digit_sums = grep{
  my $sum;
  $sum += $_ for split //,$_;
  $sum % 2 == 0;

} @numbers;

print "---\n";

foreach my $elm (@odd_digit_sums){
  # 1 16 32
  print "$elm\n";
}

print "---\n";
foreach my $elm (@numbers){
  print "$elm\n";
}

