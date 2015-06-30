#!/usr/bin/perl

use strict;
use warnings;

# スカラーリファレンスの最も単純な "インスタンス"
# $tv_horse はインスタンス固有のデータ (名前) となる
# べきものへのリファレンスになる。
# (インスタンス = bless されたリファレンス)
my $name = 'Mr. Ed';
my $tv_horse = \$name;

# $tv_horse を本物のインスタンスに変身させる演算子 bless。
# bless はリファレンスが指す変数 $name を見つけて, 変数
# $tv_horse を Horse オブジェクトに変身させる。
# $tv_horse はこれで特定の馬 (Mr. Ed) のインスタンスになっ
# ている。
bless $tv_horse, 'Horse';

{ package Animal;
  sub speak {
    my $class = shift;
    print "a $class goes ", $class->sound, "\n";
  }
}
{ package Horse;
  our @ISA = qw(Animal);
  sub sound { 'neigh' }
  sub name {
    my $self = shift;
    # $name をでリファレンス
    $$self;
  }
}

# noise: neigh
my $noise = $tv_horse->sound;
print "noise: $noise\n";

# Mr. Ed says neigh
print $tv_horse->name, " says ", $tv_horse->sound, "\n";

