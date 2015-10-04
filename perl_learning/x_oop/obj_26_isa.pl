#!/usr/bin/perl

use strict;
use warnings;

# P186
# isa メソッド

# 呼び出し元クラス or インスタンスが
# 引数のクラス or クラスを継承するクラスに属しているか
# をテストするメソッド isa()

# color, named, name, speak, default_color, eat
# DESTROY in Animal
{ package Animal;

  #use Scalar::Util qw(weaken);

  # 多くのインスタンスの情報を格納するメタ変数
  # weaken()
  #our %REGISTRY;
  sub named {
    my $class = shift;
    my $name  = shift;
    my $self = { Name => $name, Color => $class->default_color };
    bless $self, $class;
    # $self を key に使うと 文字列 として扱う
    #$REGISTRY{$self} = $self;
    #weaken($REGISTRY{$self});
    #$self;
  }

  # アクセッサ ?
  #sub registered {
  #  return map { 'a '.ref($_)." named ".$_->name } values %REGISTRY;
  #}

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

# Adding fandango
sub UNIVERSAL::fandango {
  warn 'object ', shift, " can do the fandango!\n";
  "Thank you\n";
}

# =====================================--
# Animal, named(), DESTROY(), color(),name(),
#         speak(), default_color(), eat()
# Horse @ISA(Animal), sound(), default_color(), eat()
# Sheep @ISA(Animal), sound(), default_color()
# Cow   @ISA(Animal),
# RaceHorse @ISA(Horse), named(), won(), placed(),
#                        showed(), lost(), standings()

#use Data::Dumper;

if (Horse->isa('Animal')) {  # Horse は Animal を継承するか
  # print 
  print "A Horse is an Animal.\n";
}

my $tv_horse = Horse->named("Mr. Ed");

if ($tv_horse->isa('Animal')) {  # これは Animal を継承するか
  # print
  print $tv_horse->name, " is an Animal.\n";

  if ($tv_horse->isa('Horse')) { # これは Horse を継承するか
    # print
    print 'In fact, ', $tv_horse->name, " is a Horse.\n";
  } else {
    print "...but It's not a Horse.\n";
  }
}

