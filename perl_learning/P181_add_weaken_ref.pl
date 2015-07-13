#!/usr/bin/perl

use warnings;
# + Animal クラスに名前と色の取得/設定昨日を追加。
# + use strict でも動作するようにする = our を利用。
# + ゲッターには
#   - 動物全般のインスタンスを渡しても
#   - 特定の動物のインスタンスを渡しても動作する。

# Animal パッケージから始める
use strict;
{ package Animal;
  use Carp qw(croak);
  # P172 adding
  use File::Temp qw(tempfile);

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

    ## P172 adding start
    my ($fh, $filename) = tempfile( );
    $self->{temp_fh} = $fh;
    $self->{temp_filename} = $filename;
    # end 

    bless $self, $class;
    $REGISTRY{$self} = $self;  # これも $self を返す
    # P181 Add
    weaken($REGISTRY{$self});
    $self;
  }

#$SIG{__WARN__} = sub {
#  $DB::single = 1;
#}
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

#  # P168 adding
#  sub DESTROY {
#    my $self = shift;
#    print '[', $self->name, " has died.]\n";
#  }

  # P172 modify
  sub DESTROY {
    my $self = shift;
    my $fh = $self->{temp_fh};
    close $fh;
    unlink $self->{temp_filename};
    print '[', $self->name, " has died.]\n";
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

# P178
{ package RaceHorse;
  our @ISA = qw(Horse);
  ## 親コンストラクタの拡張
  sub named {
    my $self = shift->SUPER::named(@_);
    $self->{$_} = 0 for qw(wins places shows losses);
    $self;
  }
  sub won { shift->{wins}++; }
  sub placed { shift->{places}++; }
  sub showed { shift->{shows}++; }
  sub lost { shift->{losses}++; }
  sub standings {
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

# P181
my @horses = map Horse->named($_), ('Trigger', 'Mr. Ed');
print "alive before block:\n", map("  $_\n", Animal->registered);
{
  my @cows = map Cow->named($_), qw(Bessie Gwen);
  my @racehorses = RaceHorse->named('Billy Boy');
  print "alive inside block:\n", map("  $_\n", Animal->registered);
print "--??--\n";
}
print "--??--\n";
print "alive after block:\n", map("  $_\n", Animal->registered);
print "End of program.\n";

