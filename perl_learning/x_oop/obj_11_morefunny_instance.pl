#!/usr/bin/perl

#use strict;
use warnings;

# P158 もっとおもしろいインスタンス

# オブジェクトとは ブレスされたリファレンス !

# ブレスされたハッシュリファレンスを作る。

# named(), name(), speak(), eat()
{ package Animal;

  # named と name をスカラリファレンスの期待から
  # ハッシュリファレンスの期待に変更する
  sub named {
    my $class = shift;
    my $name  = shift;
	# add
    my $self  = { Name => $name, Color => $class->default_color };
    bless \$name, $class;
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
    print $either->name, '  goes ', $either->sound, "!\n";
  }
  # add2
  sub default_color { 'brown' }
  sub eat {
    my $either = shift;
    my $food   = shift;
    print $either->name, " eats $food.\n";
  }
}

# named(), name(), speak(), eat() は
# Animal を継承して利用可能。
# sound() のみは各自自前。
{ package Horse;
  our @ISA = qw( Animal );
  sub sound { 'neigh' }
}
{ package Sheep;
  our @ISA = qw( Animal );
  sub sound { 'grass' }
  # add
  #sub default_color { 'white' }
}

# 名前と色を持つ羊
#my $lost = 'Sheep';
#print $lost->name,"\n";

my $lost = bless { Name => 'Bo', Color=> 'white' } , Sheep;
# Bo
print $lost->name, "\n";
# brown
print $lost->default_color, "\n";

# Can't locat object method "Color" via package "Sheep"
#print $lost->Color, "\n";

# white
print $lost->{Color}, "\n";
# Bo goes grass!
print $lost->speak;

