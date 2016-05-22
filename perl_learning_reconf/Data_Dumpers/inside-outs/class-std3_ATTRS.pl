#!/usr/bin/perl

# Class::Std
# http://d.hatena.ne.jp/cooldaemon/20060317/1142562536

package Hoge;

use strict;
use warnings;

use Class::Std;

# ATTRS

{

  # new や DESTROY 等を自動で定義する
  # my %name_of :ATTR;  
  # my %age_of :ATTR;  
  # は ATTRS で次のように書き換え可能
  my (%name_of, %age_of) :ATTRS;

  # setter
  sub set_age {
    my ($self, $age) = @_;
    $age_of{ ident $self } = $age;
  }
  sub set_name {
    my ($self, $name) = @_;
    $name_of{ ident $self } = $name;
  }

  # getter 
  sub get_age{
    my ($self) = @_;
    print $age_of{ ident $self }, "\n";
  }
  sub get_name {
    my ($self) = @_;
    print $name_of{ ident $self }, "\n";
  }
}

package main;

my $obj = Hoge->new();

$obj->set_age(30);
$obj->set_name('mike');

$obj->get_age;  # 30
$obj->get_name; # mike

