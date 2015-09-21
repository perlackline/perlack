#!/usr/bin/perl

use strict;
use warnings;

# P164
# クラス専用メソッドとインスタンス専用メソッド

# 呼び出し方が間違っているいる場合の例外を投げる
# ref 演算子を使う。

use Carp qw(croak);

# モジュール内ではユーザのために
# die や warn ではなく Carp 関数を使う。

sub intance_only {
  ref(my $self = shift) or crok "instance variable needed";
  # ... $self をインスタンスとして使う
}

sub class_only {
    ref(my $class = shift) or crok "class name needed";
    # ... $self をクラスとして使う
}

# ref 関数は ブレスされたリファレンスのインスタンス に対しては
# 真 文字列のクラスに対しては 偽 を返す。
