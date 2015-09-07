#!/usr/bin/perl

use strict;
use warnings;

# P152 インスタンスとインスタンス変数 (メンバ変数) の導入。

# インスタンスは通常クラスで作る。
# インスタンスは独自のアイデンティティや共有の属性、共通の動作を持てる。

{ package Animal;
  sub speak {
    my $class = shift;
    print "a $class goes ", $class->sound, "!\n";
  }
}

# Perl のインスタンスは 組み込み型のどれかへのリファレンス。

{ package Horse;
  our @ISA = qw( Animal );
  sub sound { 'neigh' }
}

# * Perl のクラスメソッドとインスタンスメソッドの違いは
# * 第 1 引数がインスタンス (ブレスされたリファレンス) か
# * クラス名 (文字列) かの違い。

# インスタンスはリファレンス。
# スカラでリファレンスを作る。
my $name = 'Mr. Ed';
my $tv_horse = \$name;

# bless で $tv_horse をクラス Horse のオブジェクトとする。
# これで$tv_horse は Horse のインスタンスになる。
bless $tv_horse, 'Horse';

# メソッド sound 呼び出し
my $noise = $tv_horse->sound;
print $noise; # neigh

# メソッド speak 呼び出し,
# Animal の speak で $tv_horse をでリファレンスしていないので
# うまくいかない
$tv_horse->speak; # Horse=SCALAR(0x15e2c68) goes neigh!

