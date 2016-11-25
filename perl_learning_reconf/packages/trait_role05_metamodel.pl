#!/usr/bin/perl

use strict;
use warnings;

# 第3回　Moose::Role：役割単位のクラス分け
# http://gihyo.jp/dev/serial/01/modern-perl/0003?page=1

# Mammal の produce_milk と名前が衝突するロール Dairying を外部に作成

package Mammal;
sub new { bless {}, shift; }
sub produce_milk { print "I can produce milk.\n"; }

package Bat;
# 基底ロール Fly 
use Class::Trait 'Fly';
use base 'Mammal';
sub fly_with { 'wings'; } # ロールで強制されたメソッド (なければエラー)

# ロール Fly を使うクラス
package Transportation;
sub new { bless {}, shift; }
sub engine_type { 'V-type engine' }

package Aircraft;
use Class::Trait 'Fly';
use base 'Transportation';
sub fly_with { shift->engine_type; }

# ロール Dairying を使うクラスを追加
package DairyFarmer;
use base 'Mammal';
# ロール Dairying をミックス (?) しつつ
# Mammal と外部の Dairying で名前が衝突するメソッド produce_milk の
# 名前に別名を指定して衝突を回避する
use Class::Trait (
  Dairying => {
     alias => { produce_milk => 'produce_cow_milk' },
     exclude => 'produce_milk',
  }
);
sub animal { 'cows' }

package main;

my $bat = Bat->new;

# Class::Trait により以下を出力
# I can fly with with wings.
$bat->fly;

my $plane = Aircraft->new;
$plane->fly;

my $farmer = DairyFarmer->new;
$farmer->produce_milk;
$farmer->produce_cow_milk;

print "does fly: ". $bat->DOES('Fly'). "\n";
