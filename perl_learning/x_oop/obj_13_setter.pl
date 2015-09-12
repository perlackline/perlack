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
  # 一つ前の値 (色) を返す。
  sub set_color {
    my $self = shift;
    # change
	#my $old  = $self->{Color};
    #$self->{Color} = shift;
	#$old;
	if (defined wantarray) {
	  # この呼び出しは void コンテキストではないので
	  # 値を返すことに意味がある
	  my $old = $self->{Color};
	  $self->{Color} = shift;
      $old;
    }else{
      # このメソッド呼び出しは void コンテキスト
      $self->{Color} = shift;
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
}
{ package Sheep;
  our @ISA = qw( Animal );
  sub sound { 'grass' }
  # add
  sub default_color { 'white' }
}
#// -------------------------------------------------------

my $tv_horse = Horse->named('Mr. Ed');
my $tv_sheep = Sheep->named('Mr. Dd');

# Mr. Ed
print $tv_horse->name, "\n";
# Mr. Dd
print $tv_sheep->name, "\n";

my $brown = $tv_horse->set_color('orange');
print $brown, "\n";
my $orange = $tv_horse->set_color($brown);
print $orange, "\n";
# brown
my $which = $tv_horse->set_color;
print $which, "\n";
# undef ??
my $which2 = $tv_horse->set_color;
print $which2, "\n";
