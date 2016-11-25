#!/usr/bin/perl

use strict;
use warnings;

# 第3回　Moose::Role：役割単位のクラス分け
# http://gihyo.jp/dev/serial/01/modern-perl/0003?page=1

use Test::More tests => 4;

package Mammal;
sub new { bless {}, shift; }
sub produce_milk { print "I can produce milk.\n"; }

# Bird を変更したら ...?
package Bird;
use base 'Exporter';
our @EXPORT_OK = qw(fly);
sub new { bless {}, shift; }
sub fly_with { 'wings' } #*
sub fly {
  my $self = shift; #*
  print "I can fly with ". $self->fly_with. ".\n"; #*
}

package Bat;
Bird->import('fly');  # use Bird 'fly';
use base 'Mammal';

package main;

my $bat = Bat->new;

can_ok($bat => 'produce_milk'); # ok
can_ok($bat => 'fly');          # ok
ok($bat->isa('Mammal'));        # ok
ok( !$bat->isa('Bird'));        # ok コウモリは鳥類ではなくなった

# 上記テストは ok だが Bat に fly-with がないため
# Can't locate object method "fly_with" via package "Bat" at .. でエラー
$bat->fly;
