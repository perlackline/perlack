#!/usr/bin/perl

use strict;
use warnings;

use File::Find;

my $callback;

# 裸のブロックを利用した closure
{
  # $count の参照カウント 1
  my $count = 0;

  # 無名 sub 内に $count を閉包 ( closure )
  # $count の参照カウント 2
  $callback = sub { print ++$count, ": $File::Find::name\n" };

# $count の参照カウント1
# 名前 count は参照外になるが $callback 内の sub に
# 参照カウントが残る
}
# 上記閉じたスコープ内の my $count に
# 以下スコープ外の find() から $callback を通して
# アクセスする

# sub 内に残った$count への参照カウントを利用する
find($callback, '.');

