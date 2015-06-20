#!/usr/bin/perl

# (!) 条件にあった動作をしない !? ...

use strict;
use warnings;

# Animal と同じレベルに Person クラスを追加する。
# これら 2 つのクラスを LivingCreature クラスが継承するようにする。

# speak メソッドは言うべきことを指定する引数を取るように書き換えて
# 引数が指定されてなければ sound を呼び出す (Person の場合はハミン
# グする。

# 動物は話さない。

# つまり動物の speak メソッドは引数を取らない。

# 動物の sound を定義し忘れているなどプログラム実行時に発生しそうな
# エラーをキャッチするように注意。

# 最後に言うべきことを与えずに Person を呼び出すコードと何か言うべ
# きことを与えて Person を呼び出すコードと何か言うべきことを与えて
# Person を呼び出すコードを書いてPerson クラスを試す。

# speak メソッドだけを持つ LivingCreature
{ package LivingCreature;
  sub speak {
    my $class = shift;
    if (@_) {    # 言うべきこと
      print "a $class goes '@_'\n";
    }else{
      print "a $class goes ", $class->sound, "\n";
    }
  }
}

# LivingCreature の派生クラス Person
{ package Person;
  our @ISA = qw(LivingCreature);
  sub sound { 'hmmmm' }
}

# Animal クラス。
# 鳴き声は発するが話はできないようにする。
{ package Animal;
  our @ISA = qw(LivingCreature);
  sub sound { die "all Animals should define a sound" }
  sub speak {
    my $class = shift;
    die "animals can't talk!" if @_;
    $class->SUPER::speak;
  }
}
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
  sub sound { "baaah" }
}
{ package Mouse;
  our @ISA = qw(Animal);
  sub sound { "squeak" }
  sub speak {
    my $class = shift;
    $class->SUPER::speak;
    print "[but you can barely hear it!]\n";
  }
}

## 対話部分
#my @barnyard = ();
#{
#  print "enter an animal (empty to finish): ";
#  chomp(my $animal = <STDIN>);
#  $animal = ucfirst lc $animal;  # 正規化
#  last unless $animal =~ /^(Person|Cow|Horse|Sheep|Mouse)$/;
#  push @barnyard, $animal;
#  redo;
#}
#
#foreach my $beast (@barnyard) {
#  $beast->speak;
#}

# 最後にヒトに話をさせる。
Person->speak;  # ハミングのみ
Person->speak("Hello, world!");

Cow->speak;
Horse->speak;
Sheep->speak;
Mouse->speak;
Cow->speak ("Hello");


