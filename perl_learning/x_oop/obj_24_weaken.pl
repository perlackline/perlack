#!/usr/bin/perl

use strict;
use warnings;

# P180
# リファレンスを弱める

# use Scalar::Util の weaken でリファレンスを弱くすることで
# 参照カウントとしてカウントされなくする。

# color, named, name, speak, default_color, eat
# DESTROY in Animal
{ package Animal;

  use Scalar::Util qw(weaken);

  # 多くのインスタンスの情報を格納するメタ変数
  # Adding weaken()
  our %REGISTRY;
  sub named {
    my $class = shift;
    my $name  = shift;
    my $self = { Name => $name, Color => $class->default_color };
    bless $self, $class;
    # $self を key に使うと 文字列 として扱う
    $REGISTRY{$self} = $self;
    # Adding
    weaken($REGISTRY{$self});
    $self;
  }

  # Adding アクセッサ ?
  sub registered {
    return map { 'a '.ref($_)." named ".$_->name } values %REGISTRY;
  }

  # DESTROY で一時ファイルを確実に削除する
  sub DESTROY {
    my $self = shift;
    print '[', $self->name, " has died.]\n";
  }

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
  sub DESTROY {
    my $self = shift;
    $self->SUPER::DESTROY;
    print "[", $self->name, " has gone off to the glue factory.]\n";
  }
}

{ package Sheep;
  our @ISA = qw( Animal );
  sub sound { 'grass' }
  sub default_color { 'white' }
}

# adding
{ package Cow;
  our @ISA = qw( Animal );
}

{ package RaceHorse;
  # Horse を継承
  our @ISA = qw(Horse);
  # 親の Horse を拡張
  sub named {
    # 引数をすべて 親 の named() に渡してセットする
    my $self = shift->SUPER::named(@_);
    # ($self->{$_} = 0) for qw(...)
    $self->{$_} = 0 for qw(wins places shows losses);
    $self;
  }
  # アクセスメソッド
  sub won { shift->{wins}++; }
  sub placed { shift->{places}++; }
  sub showed { shift->{shows}++; }
  sub lost { shift->{losses}++; }
  sub standings {
    my $self = shift;
    join ', ', map "$self->{$_} $_", qw(wins places shows losses);
  }
}

#use Data::Dumper;

my @horses = map Horse->named($_), ('Trigger', 'Mr. Ed');
print "alive before block:\n", map(" $_\n", Animal->registered);
{
  #my @cows = map Cow->named($_), qw(Bessie Gwen);
  my @racehorses = RaceHorse->named('Billy Boy');
  print "alive inside block:\n", map(" $_\n", Animal->registered);
}

#print "@cows\n", Dumper(@cows);
#print "@horses\n", Dumper(@horses);
#print "@racehorses\n", Dumper(@racehorses);

print "alive after block:\n", map(" $_\n", Animal->registered);
print "End of program.\n";

