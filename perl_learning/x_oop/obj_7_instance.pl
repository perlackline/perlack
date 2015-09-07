#!/usr/bin/perl

use strict;
use warnings;

# P153 インスタンスデータへのアクセス

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
  # 名前を取り出すメソッド
  sub name {
    my $self = shift;
    $$self;
  }
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

# 名前の取り出し
print $tv_horse->name, "\n"; 

