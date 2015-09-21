#!/usr/bin/perl

use strict;
use warnings;

# P167
# オブジェクトのデストラクション

# color, named, name, speak, default_color, eat
{ package Animal;

  sub color {
    my $self = shift;
    # 他に引数があればゲッター
    if (@_) {
      $self->{Color} = shift;
    } else {
    # 他に引数がなければセッター
      $self->{Color};
    }
  }

  sub named {
    my $class = shift;
    my $name  = shift;
    my $self = { Name => $name, Color => $class->default_color };
    bless $self, $class;
  }

  sub name {
    my $either = shift;
    # $either はリファレンス (インスタンス) か ?
    ref $either
    ? $either->{Name}       # インスタンスの場合はデリファレンス
    : "an unnamed $either"; # クラスの場合はまま名前を返す
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

{ package Horse;
  our @ISA = qw( Animal );
  sub sound { 'neigh' }
  sub default_color { 'white' }
}

{ package Sheep;
  our @ISA = qw( Animal );
  sub sound { 'grass' }
  sub default_color { 'white' }
}

...
