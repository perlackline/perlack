#!/usr/bin/perl

# Class::Std
# http://d.hatena.ne.jp/cooldaemon/20060317/1142562536

# 個人開発では Class::Accessor や Class::MethodMaker で充分だが
# チーム開発では Class::Std が有用

# 基本

package Hoge;

use strict;
use warnings;

use Class::Std;

{
  # Attributes
  # ゲッター, セッター, new が自動で定義される
  my %name_of :ATTR( :name<name> );
  my %age_of  :ATTR( :name<age> );

  sub say_name {
    my ($self) = @_;
    print $name_of{ ident $self }, "\n";
  }
}

package main;

# :name で指定した attribute は new の呼び出しで
# 初期値を設定する必要がある
# 初期値を設定しないとエラーになる
my $obj = Hoge->new({name => 'mike', age => 28});
print $obj->get_age, "\n"; # 28

$obj->say_name(); # mike
