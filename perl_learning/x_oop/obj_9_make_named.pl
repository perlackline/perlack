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
  # $class の名前を $either に変更するだけ。
  sub speak {
    my $either = shift;
    print $either->name, '  goes ', $either->sound, "!\n";
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

# an unnamed Horse
print Horse->name, "\n";

my $named_horse = Horse->named('Edward');
# Edwoard
print $named_horse->name, "\n";

