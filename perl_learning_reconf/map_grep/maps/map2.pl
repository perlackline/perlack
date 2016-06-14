#!/usr/bin/perl

use strict;
use warnings;
use utf8;
use Encode;

sub big_money {

  # 小数点以下 2 桁でフォーマット
  my $number = sprintf "%.2f", shift @_;

  # 1 ループで末尾 3 桁にカンマを 1 個挿入する
  1 while $number =~ s/^(-?\d+)(\d\d\d)/$1,$2/;

  # 正しい位置にドル記号を挿入
  $number =~ s/^(-?)/$1\$/;
  $number;
}

# フォーマット対象の数値
my @data = (qw/4.75 1.5 2 1234 6.9456 12345678.9 29.95/);

# フォーマット
my @formatted_data = map (big_money($_), @data);
#my @formatted_data = map { big_money($_) } @data;

# 出力
foreach my $index (0..$#data) {
  print "data     : $data[$index]\n";
  print "formatted: $formatted_data[$index]\n";
  print "\n";
}

