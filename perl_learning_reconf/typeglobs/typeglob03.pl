#!/usr/bin/perl

use strict;
use warnings;

our @ary = (1, 2, 3);

print "before: @ary\n";

# 引数を型グロブで指定
sub_routin(*ary);

print "after : @ary\n";

sub sub_routin {

  # 型グロブで引数を受け取る
  local *in_sub = shift @_;

  # 配列のスロットを操作
  push @{*in_sub}, "add";
}

