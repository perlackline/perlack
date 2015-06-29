#!/usr/bin/perl

# + Animal クラスに名前と色の取得/設定昨日を追加。
# + use strict でも動作するようにする = our を利用。
# + ゲッターには
#   - 動物全般のインスタンスを渡しても
#   - 特定の動物のインスタンスを渡しても動作する。

# Animal パッケージから始める
use strict;
{ package Animal;
  use Carp qw(croak);

  # コンストラクタ
  sub named {
    ref (my $class = shift) and croak "class name needed";
    my $name = shift;
    my $self = { Name => $name, Color => $class->default_color };
    bless $self, $class;
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
}

  # 以上が抽象基底クラスの定義。
  # 以下がインスタンスを持てる具象クラスの定義。

{ package Horse;
  our @ISA = qw(Animal);
  sub sound { "neigh" }
}
{ package Sheep;
  our @ISA = qw(Animal);
  sub color { "white" }  # デフォルトの色をオーバーライド
  sub sound { "baaaah" }
}

# クラスのテストコード
my $tv_horse = Horse->named("Mr. Ed");
$tv_horse->set_name("Mister Ed");
$tv_horse->set_color("grey");
print $tv_horse->name, " is ", $tv_horse->color, "\n";
print Sheep->name, " colored ", Sheep->color, " goes ", Sheep->sound, "\n";

