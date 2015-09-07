#!/usr/bin/perl

use strict;
use warnings;

# P147 SUPER なやり方
# @ISA に含まれるクラス = SUPER クラス
{ package Animal;
  sub speak {
    my $class = shift;
    print "a $class goes ", $class->sound, "!\n";
  }
}

{ package Mouse;
  our @ISA = qw ( Animal );
  sub sound { 'squeak' }
  # メソッド speak のオーバーライド
  sub speak {
    my $class = shift;
    # Animal の代わりに SUPER を使う
    $class->SUPER::speak;
    # メソッド speak の引数を親クラスに渡したいときは
    # $class->SUPER::speak(@_) で渡せる。
    print "[but you can barely hear it!]\n";
  }
}

{ package Cow;
  our @ISA = qw( Animal );
  sub sound { 'mooo' }
}
{ package Horse;
  our @ISA = qw( Animal );
  sub sound { 'neigh' }
}
{ package Sheep;
  our @ISA = qw( Animal );
  sub sound { 'baaah' }
}

Mouse->speak;
