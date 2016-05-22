#!/usr/bin/perl

# Class::Std
# http://d.hatena.ne.jp/cooldaemon/20060317/1142562536

package Hoge;

use strict;
use warnings;

use Class::Std;

# :get :set :init_arg

{
  # Attributes (getter, setter, new を自動で定義)
  # :default で初期値を設定
  my %name_of :ATTR( :name<name> :default('mike') );
  #my %age_of  :ATTR( :name<age> :default(29) );

  # getter のみを定義
  # my %age_of :ATTR( :get<age> );

  # setter のみを定義
  # my %age_of :ATTR( :set<age> );

  # new 呼び出し時の引数を定義
  #%age_of :ATTR( :init_arg<age>);

  # my %age_of :ATTR( :name <age> ) は
  my %age_of :ATTR( :init_arg<age> :get<age> :set<age> );
  # と同じ
 
  sub say_name {
    my ($self) = @_;
    print $name_of{ ident $self };
  }
}

package main;

# :default で初期値を設定してあるので
# :name で指定した attribute の new の呼び出しで
# 初期値を設定しなくてもエラーにならない
my $obj = Hoge->new({age => 29});
print $obj->get_age, "\n"; # 29
print $obj->get_name, "\n"; # mike

