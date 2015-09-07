#!/usr/bin/perl

use strict;
use warnings;

# P146 異なる場所からの検索
{ package Animal;
  sub speak {
    my $class = shift;
    print "a $class goes ", $class->sound, "!\n";
  }
}

# Mouse の spaek 内で Animal の speak を呼び出して使う。
# ただしこれは醜いコード ... 
# @ISA に複数エントリがある場合や
# @ISA と他パッケージの同期を手作業でいないといけないので
# つぎ (obj_5.pl) の SUPER なやり方 (P147) を使う。
{ package Mouse;
  our @ISA = qw ( Animal );
  sub sound { 'squeak' }
  # メソッド speak のオーバーライド
  sub speak {
    my $class = shift;
    # Animal の speak をつかう。
    # Animal::speak($class) も使えるが
    # -> を使わない呼び出しは 継承 を使わない
    # タダのサブルーチンの呼び出しになる。
    # 醜いコードだがの書き方ができる。
    # これなら Animal の継承チェーンを利用可能。
    $class->Animal::speak(@_);
    #print "a $class goes ", $class->sound, "!\n";
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
