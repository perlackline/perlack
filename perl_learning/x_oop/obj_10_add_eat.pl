#!/usr/bin/perl

use strict;
use warnings;

# named(), name(), speak(), eat()
{ package Animal;
  # 新しい名前をもつ動物のためのコンストラクタ
  sub named {
    my $class = shift;
    my $name  = shift;
    bless \$name, $class;
  }
  sub name {
    my $either = shift;
    ref $either   # $eihter はリファレンス (インスタンス) か ?
      ? $$either  # インスタンスの場合はでリファレンス
      : "an unnamed $either"; # クラスの場合はそのまま名前を返す。
  }
  sub speak {
    my $either = shift;
    print $either->name, '  goes ', $either->sound, "!\n";
  }
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
  sub soun { 'grass' }
}

my $tv_horse = Horse->named('Edword');
# Animal::eat($tv_horse, 'hay') と同じ
$tv_horse->eat('hay');
