#!/usr/bin/perl

use strict;
use warnings;

# P.155 コンストラクタ named を Animal に任せる。

{ package Animal;
  # name の取得
  sub name {
    my $either = shift;
    # クラス名で呼び出されても
    # インスタンスで呼び出されても対応可能にする
    ref $either   # $eihter はリファレンス (インスタンス) か ?
      ? $$either  # インスタンスの場合はでリファレンス
      : "an unnamed $either"; # クラスの場合はそのまま名前を返す。
  }
  # speak も $either を使うようにする。
  sub speak {
    my $class = shift;
    print $class->name, '  goes ', $class->sound, "!\n";
    # print $class, '  goes ', $class->sound, "!\n";
  }
  # 新しい馬のコンストラクタを Animal に統合
  sub named {
    my $class = shift;
    my $name  = shift;
    bless \$name, $class;
  }
}

# シンプルになった Horse
{ package Horse;
  our @ISA = qw( Animal );
  sub sound { 'neigh' }
}

my $tv_horse = Horse->named('Mr. Ed');
$tv_horse->speak;

