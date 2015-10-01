#!/usr/bin/perl

use strict;
use warnings;

# P176
# サブクラスでのインスタンス変数の追加
# Adding RaceHose()

# データ構造にハッシュを使うメリットの 1 つ。
#  派生クラスでインスタンス変数を追加しても
#  スーパークラス (親クラス) では何も汁必要がない。

# color, named, name, speak, default_color, eat
# DESTROY in Animal
{ package Animal;

  use File::Temp qw(tempfile);

  sub named {
    my $class = shift;
    my $name  = shift;
    my $self = { Name => $name, Color => $class->default_color };
    # adding start 'make temp file'
    my ($fh, $filename) = tempfile();
    $self->{temp_fh} = $fh;
    $self->{temp_filename} = $filename;
    # adding end
    bless $self, $class;
  }

  # DESTROY で一時ファイルを確実に削除する
  sub DESTROY {
    my $self = shift;
    # Change with temp file
    # ファイルハンドルを close してファイルを削除する
    my $fh = $self->{temp_fh};
    close $fh;
    unlink $self->{temp_filename};
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
    my $self = shift->SUPER::named(@_);
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

use Data::Dumper;

my $racer = RaceHorse->named('Billy Boy');

print Dumper($racer);

$racer->won;
$racer->won;
$racer->won;
$racer->showed;
$racer->lost;
print $racer->name, ' has standings of: ', $racer->standings, ".\n";

