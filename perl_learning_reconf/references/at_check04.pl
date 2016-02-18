#!/usr/bin/perl

use strict;
use warnings;

my @ary = (1, 2, 3);

print "before: @ary\n";

sub_routine(\@ary);

print "after : @ary\n";

sub sub_routine {

  # 引数のリファレンスを取得
  my $ref_ary = shift;

  my $add_value = 'add';

  # デリファレンスして要素を追加
  push @{$ref_ary}, $add_value;
}


