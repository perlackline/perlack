#!/usr/bin/perl

use strict;
use warnings;

# P162
# オブジェクトを返すことによる
# 再帰的な設定処理

# named(), name(), speak(), eat(), default_color(),
# color(), set_color(),
{ package Animal;

  # add
  sub color {
    my $self = shift;
    $self->{Color};
  }

  # オブジェクトを返す
  sub set_color {
    my $self = shift;
    $self->{Color} = shift;
    $self;
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
}
{ package Sheep;
  our @ISA = qw( Animal );
  sub sound { 'grass' }
  # add
  sub default_color { 'white' }
}
#// -------------------------------------------------------

# オブジェクトを返すことによる
# 再帰的な設定処理
my $tv_horse =
    Horse->named('Mr. Ed')
         ->set_color('grey');

# Mr. Ed
print $tv_horse->name, "\n";
# grey
print $tv_horse->color, "\n";
