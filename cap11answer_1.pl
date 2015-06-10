#!/usr/bin/perl

# Animal, Cow, Horse, Sheep, Mouse クラスを定義。
# use strict を定義しても動作させるため our を使う。
# ユーザに動物の名前を入力させる。
# 個々の動物は 1 回ずつ鳴かせる。

# 1 つのメソッドをもつ Animal クラス
{ package Animal;
  sub speak {
    my $class = shift;
    print "a $class goes ", $class->sound, "!\n";
  }
}

# 特定の鳴き声とサブクラスのパッケージ
{ package Cow;
  our @ISA = qw(Animal);
  sub sound { "moooo" }
}
{ package Horse;
  our @ISA = qw(Animal);
  sub sound { "neigh" }
}
{ package Sheep;
  our @ISA = qw(Animal);
  sub sound { "baaaah" }
}
# コメントを追加する Mouse のパッケージ
{ package Mouse;
  our @ISA = qw(Animal);
  sub sound { "squeak" }
  sub speak {
    my $class = shift;
    $class->SUPER::speak;
    print "[but you can barely hear it!]\n";
  }
}

# 入力を促す対話部分
my @barnyard = ( );
{
  print "enter an animal (empty to finish)";
  chomp(my $animal = <STDIN>);
  $animal = ucfirst lc $animal;  # 正規化
  last unless $animal =~ /^(Cow|Horse|Sheep|Mouse)$/;
  push @barnyard, $animal;
  redo;
}

foreach my $beast (@barnyard) {
  $beast->speak;
}
