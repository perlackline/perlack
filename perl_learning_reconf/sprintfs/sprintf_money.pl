#!/usr/bin/perl

use strict;
use warnings;
use utf8;

# プロンプト
print "\n--- Insert comma into number ---\n";
print "Please entert a price: ";

# 入力受付
while (<STDIN>) {
  chomp;
  # 値チェック (金額以外が入力された場合)
  unless ( /^-?\d+\.?(\d+)?$/ ) {
    # 体感調整
    sleep 1;
    # 注意
    print "\nSorry, we will accept a numrical price only.\n";
    # 再入力用プロンプト
    print "---\n";
    print "Entert a price again: ";
    next;
  }

  # カンマ挿入サブルーチンの呼び出し
  my $price = big_money($_);
  # 体感調整
  sleep 2;

  print "price: $price\n\n";
  # 金額が正しく生成された場合は
  # ループを抜けてプログラムを終了
  exit;
}

# カンマ挿入サブルーチン
# By 「 初めての Perl 第 6 版」( 14.3 章 ) 
sub big_money {
  my $number = sprintf "%.2f", shift @_;
  1 while $number =~ s/^(-?\d+)(\d\d\d)/$1,$2/;
  $number =~ s/^(-?)/$1\$/;
  $number;
} 

