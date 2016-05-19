#!/usr/bin/perl

#use strict;
#use warnings;

# http://www.chikkun.com/und/document/perl/inside_out.html
# 変数のスコープからインサイドアウトクラスまで

my $var = "サブルーチンの外\n";
&example;
print $var; # example2 サブルーチンの中 を出力

sub example {
  my $var = "example サブルーチンの中\n";
  print $var; # サブルーチンの中 を出力
  &example2("example2 サブルーチンの中\n");
}

sub example2 {
  # "サブルーチンの外\n" を上書きしてしまう。
  $var = shift;
  print $var; # example2 サブルーチンの中 を出力
}

__END__
# output
example サブルーチンの中
example2 サブルーチンの中
example2 サブルーチンの中

