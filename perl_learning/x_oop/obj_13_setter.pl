#!/usr/bin/perl

use strict;
use warnings;

# P160 セッターから何を返すか

# セッターは値を設定するメソッド。
# セッターが返すべきもの
#   + 更新後の値 (渡されたものと同じ
#   + 元の値 (umask や 1 引数形式の select に似た形)
#   + オブジェクト自体
#   + 成否を知らせるコード

# named(), name(), speak(), eat(), default_color(),
# color(), set_color(),
{ package Animal;

  # add
  sub color {
    my $self = shift;
    $self->{Color};
  }
  # add (セッター ?)
  sub set_color {
    my $self = shift;
    # change
	my $old  = $self->{Color};
    $self->{Color} = shift;
	$old;
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

my $tv_horse = Horse->named('Mr. Ed');
# Mr. Ed
print $tv_horse->name, "\n";

# orange
$tv_horse->set_color('orange');
print $tv_horse->color, "\n";
# blue
$tv_horse->set_color('blue');
print $tv_horse->color, "\n";
# bule ? not orange ?
#$tv_horse->set_color($tv_horse->set_color));
$tv_horse->set_color($tv_horse->set_color));
print $tv_horse->color, "\n";

my $tv_sheep = Sheep->named('Mr. Dd');
print $tv_sheep->name, "\n";
# blue
$tv_sheep->set_color(($tv_horse->set_color));
print $tv_sheep->color, "\n";

