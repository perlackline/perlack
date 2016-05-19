#!/usr/bin/perl

#use strict;
#use warnings;

# http://www.chikkun.com/und/document/perl/inside_out.html
# 変数のスコープからインサイドアウトクラスまで

# local のダイナミックスコープ
our $var = "サブルーチンの外\n";
&example;
print $var; # サブルーチンの外 を出力

sub example {
  # このスコープ内のみ L.10 の $var を動的に上書き
  local $var = "サブルーチンの中\n";
  print $var; # サブルーチンの中 を出力
  &example2;
}

sub example2 {
  # example の local スコープを外れているので
  # $var は動的に L.10 の状態に戻る
  print $var; # サブルーチンの外 を出力
}

__END__
# output
サブルーチンの中
サブルーチンの中
サブルーチンの外

