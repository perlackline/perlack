#!/usr/bin/perl

use strict;
use warnings;

# 第3回　Moose::Role：役割単位のクラス分け
# http://gihyo.jp/dev/serial/01/modern-perl/0003?page=1

# Class::Trait でメソッド fly と fly_with を分離

package Mammal;
sub new { bless {}, shift; }
sub produce_milk { print "I can produce milk.\n"; }

#package Bird;
#use base 'Exporter';
#our @EXPORT_OK = qw(fly);
#sub new { bless {}, shift; }
#sub fly_with { 'wings' } 
#sub fly {
#  my $self = shift; 
#  print "I can fly with ". $self->fly_with. ".\n"; 
#}

# メソッド fly は外部ファイル Fly.pm のロール Fly に切り分け

# ロール Fly を利用するように変更
package Bat;
# 基底ロール Fly 
use Class::Trait 'Fly';
use base 'Mammal';
sub fly_with { 'wings'; } # ロールで強制されたメソッド (なければエラー)

# ロール Fly を使う新たなクラスを追加
package Transportation;
sub new { bless {}, shift; }
sub engine_type { 'V-type engine' }

package Aircraft;
use Class::Trait 'Fly';
use base 'Transportation';
sub fly_with { shift->engine_type; }

package main;

my $bat = Bat->new;

# Class::Trait により以下を出力
# I can fly with with wings.
$bat->fly;

my $plane = Aircraft->new;

$plane->fly;
