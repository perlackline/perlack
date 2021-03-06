#!/usr/bin/perl

use strict;
use warnings;

# 第3回　Moose::Role：役割単位のクラス分け
# http://gihyo.jp/dev/serial/01/modern-perl/0003?page=1

use Test::More tests => 4;

package Mammal;
sub new { bless {}, shift; }
sub produce_milk { print "I can produce milk.\n"; }

package Bird;
sub new { bless {}, shift; }
sub fly { print "I can fly.\n"; }

package Bat;
use base qw(Mammal Bird);

package main;

my $bat = Bat->new;

can_ok($bat => 'produce_milk'); # ok
can_ok($bat => 'fly');          # ok
ok($bat->isa('Mammal'));        # ok
ok($bat->isa('Bird'));          # ok でも, コウモリは本当に鳥類か ?

