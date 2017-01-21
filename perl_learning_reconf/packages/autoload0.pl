#!/usr/bin/perl

use strict;
use warnings;

# check AUTOLOAD

package SomeClass;
sub new {
  my $class = shift;
  my $name = shift || 'Tarou';
  my $self = { Name => $name };
  bless $self, $class;
}

# コンストラクタ以外のメソッドはまだない ...

package main;

my $obj = SomeClass->new;

# メソッド name は定義されていない !
print $obj->name, "\n";

