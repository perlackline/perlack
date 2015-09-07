#!/usr/bin/perl

use strict;
use warnings;

# P.154 馬を作る
# 新しい馬のコンストラクタを設定する。

{ package Animal;
  sub speak {
    my $class = shift;
    print "a $class goes ", $class->sound, "!\n";
  }
}

# 新しい馬 (の名前) のコンストラクタ named を作る。
{ package Horse;
  our @ISA = qw( Animal );
  sub sound { 'neigh' }
  # 名前を取り出すメソッド
  sub name {
    my $self = shift;
    $$self;
  }
  # 新しい馬のコンストラクタ
  sub named {
    # Horse
    my $class = shift;
    # Mr. Ed
    my $name  = shift;
    bless \$name, $class;
  }
}

# メソッド named で新しい馬を作る。
# 引数として Horse と Mr. Ed が渡される
my $tv_horse = Horse->named('Mr. Ed');

print $tv_horse->sound, "\n";
