#!/usr/bin/perl

use strict;
use warnings;

# P163
# セッターとしても使えるゲッター

# 第 2 引数以降 (パッケージ名とメソッド名以降) の
# 引数があるかどうかをチェックして振る舞いを変える。
# 第 3 以上の引数があればセッター。
# なければゲッターとして color() を利用する。
# これに伴い set_color() を破棄。

# named(), name(), speak(), eat(), default_color(),
# color()
{ package Animal;

  # setter and getter
  sub color {
    my $self = shift;
    # 他に引数があれば
    if (@_) {
      # ゲッター
      $self->{Color} = shift;
    # なければ
    } else {
      # セッター
      $self->{Color};
    }
  }

  # named と name をスカラリファレンスの期待から
  # ハッシュリファレンスの期待に変更する
  sub named {
    my $class = shift;
    my $name  = shift;
	# add
    my $self  = { Name => $name, Color => $class->default_color };
    bless $self, $class;
  }
  sub name {
    my $either = shift;
    ref $either   # $eihter はリファレンス (インスタンス) か ?
     # ? $$either  # インスタンスの場合はでリファレンス
      ? $either->{Name}
      : "an unnamed $either"; # クラスの場合はそのまま名前を返す。
  }
  sub speak {
    my $either = shift;
    print $either->name, ' goes ', $either->sound, "!\n";
  }
  sub default_color { 'brown' }
  sub eat {
    my $either = shift;
    my $food   = shift;
    print $either->name, " eats $food.\n";
  }
}
#// -------------------------------------------------------

{ package Horse;
  our @ISA = qw( Animal );
  sub sound { 'neigh' }
  # add
  sub default_color { 'white' }
}
{ package Sheep;
  our @ISA = qw( Animal );
  sub sound { 'grass' }
  # add
  sub default_color { 'white' }
}
#// -------------------------------------------------------

my $tv_horse = Horse->named('Mr. pow');

#$tv_horse->color('pow-color');

print $tv_horse->color, "\n";

