#!/usr/bin/perl

# cap13 Q1
# RaceHorse クラスを書き換える。
# 馬を作った時に DBM ハッシュから以前の成績を受け取る。
# 馬が破棄されたときに成績を更新する。
# DBM ハッシュのキーは馬の名前。

use warnings;
use strict;

# Animal パッケージから始める
{ package Animal;
  use Carp qw(croak);

  # コンストラクタ
  # P179 Add, name を反復処理するハッシュで拡張する
  our %REGISTRY;
  # P181 Add, 弱いリファレンス weaken を追加
  use Scalar::Util qw(weaken); # 5.8 以降の場合
  #use WeakRef qw(weaken);    # CPAN モジュールをインストールした 5.6

  sub named {
    ref (my $class = shift) and croak "class name needed";
    my $name = shift;
    my $self = { Name => $name, Color => $class->default_color };

    bless $self, $class;
    $REGISTRY{$self} = $self;  # これも $self を返す
    # P181 Add
    weaken($REGISTRY{$self});
    $self;
  }

  # P179 Add, ハッシュの処理, これですべての動物を見られる
  sub registered {
    return map { 'a '. ref($_) . " named " . $_->name } values %REGISTRY;
  }

  # 仮想メソッド (サブクラスでオーバーライドすべきメソッド)。
  # Perl は基底クラスで仮想メソッドの宣言は不要だがドキュメント
  # 用として役立つ。

  # デフォルト (必ずオーバーライドすること) 
  sub default_color { "brown" }
  sub sound { croak "subclass must define a sound" }

  # クラスからでもインスタンスからでも呼び出せるメソッド。
  
  # クラス / インスタンスメソッド
  sub speak {
    my $either = shift;
    print $either->name, " goes ", $either->sound, "\n";
  }
  sub name {
    my $either = shift;
    ref $either
      ? $either->{Name}
      : "an unnamed $either";
  }
  sub eat {
    my $either = shift;
    my $food = shift;
    print $either->name, " eats $food.\n";
  }
  sub color {
    my $either = shift;
    ref $either
      ? $either->{Color}
      : $either->default_color;
  }

  # インスタンス専用メソッド
  sub set_name {
    ref (my $self = shift) or croak "instance variable needed";
    $self->{Name} = shift;
  }
  sub set_color {
    ref (my $self = shift) or croak "instance variable needed";
    $self->{Color} = shift;
  }

  # P172 modify
  sub DESTROY {
    my $self = shift;
    print '[', $self->name, " has died.]\n";
    delete $REGISTRY{$self};
  }

}

  # 以上が抽象基底クラスの定義。
  # 以下がインスタンスを持てる具象クラスの定義。

{ package Horse;
  our @ISA = qw(Animal);
  sub sound { "neigh" }
  # P173
  sub DESTROY {
    my $self = shift;
    $self->SUPER::DESTROY;
    print "[", $self->name, " has gone off to the glue factory.]\n";
  }
}

# P183 Q1
{ package RaceHorse;
  our @ISA = qw(Horse);
  ## 親コンストラクタの拡張
  # 単純な dbmopen で %STANDINGS と永続記憶域を対応付ける。
  dbmopen (our %STANDINGS, "cap13_standings", 0666)
    or die "Cannot access cap13_standings dbm: $!";
  # 新しい RaceHose が作られたら, データベースから
  # 既存の成績を引き出すかすべてが 0 の新しい情報を作る。
  sub named {
    my $self = shift->SUPER::named(@_);
    my $name = $self->name;
    my @cap13_standings = split ' ', $STANDINGS{$name} || "0 0 0 0";
    @$self{ qw(wins places shows losses) } = @cap13_standings;
    $self;
  }
  # RaceHorse が破棄されると成績が更新される。
  sub DESTROY {  # インスタンスメソッド (自動的に起動される)
    my $self = shift;
    $STANDINGS { $self->name } = "@$self{ qw(wins places shows losses) }";
    $self->SUPER::DESTROY;
  }
  sub won { shift->{wins}++; }
  sub placed { shift->{places}++; }
  sub showed { shift->{shows}++; }
  sub lost { shift->{losses}++; }
  sub cap13_standings {
    my $self = shift;
    join ', ', map "$self->{$_} $_", qw(wins places shows losses);
  }
}

{ package Sheep;
  our @ISA = qw(Animal);
  sub color { "white" }  # デフォルトの色をオーバーライド
  sub sound { "baaaah" }
}
{ package Cow;
  our @ISA = qw(Animal);
  sub sound { "moooo" }
}

# ---

# P186
if (Horse->isa('Animal')) {    # Horse は Animal から継承しているか
  print "A Horse is an Animal.\n";
}

my $tv_horse = Horse->named("Mr. Ed");
if ($tv_horse->isa('Animal')) {  # これは Animal か
  print $tv_horse->name, " is an Animal.\n";
  if ($tv_horse->isa('Horse')) { # これは Horse か
    print 'In fact, ', $tv_horse->name, " is a Horse.\n";
  } else {
    print "...but it's not a Horse.\n";
  }
}

