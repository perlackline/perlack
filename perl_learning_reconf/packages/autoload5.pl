#!/usr/bin/perl

use strict;
use warnings;

# check AUTOLOAD

package SomeClass;

# デフォルト値 (ハッシュリファレンス)
my $default = { Name => 'Tarou', Age => 30, Weight => 70, Height => 180 }; 

# コンストラクタ
sub new {
  my $class = shift;
  bless $default, $class;
}

# 空のデストラクタ for AUTOLOAD
sub DESTROY {};

# アクセサメソッドの自動生成
sub AUTOLOAD {

  # 対応するメソッド
  my @methods = qw(name age weight height);

  our $AUTOLOAD;

  # /::(\w+)$/ が @methods の要素と一致すれば
  if ($AUTOLOAD =~ /::(\w+)$/ and grep $1 eq $_, @methods){

    # キャプチャした文字列 $1 の先頭を大文字にしてセット
    my $field = ucfirst $1;
    {
      # 型グロブを操作するために refs の制約を一時的に解除
      no strict 'refs';

      # 型グロブにコードレフをセット
      *{$AUTOLOAD} = sub { 
        my $self = shift;
        $self->{$field} = shift if @_;
        $self->{$field}; };
    }

    # セットしたサブルーチン (メソッド) へジャンプ
    goto &{$AUTOLOAD};

  }else{

    use Carp;
    # call されたメソッドが @methods にない場合
    my $class = shift;
    carp ref($class), " does not know $AUTOLOAD";
  }
}

package main;

my $obj = SomeClass->new;

# 各メソッドで ゲット/セット/ゲット (Foo は unknown)
foreach my $method (qw(name Foo height weight age)){
  print "$method: ". $obj->$method. "\n";
  my $value = ($method eq 'name') ? 'Jirou' :
              ($method eq 'height') ? 110 :
              ($method eq 'weight') ? 50 :
              ($method eq 'age') ? 60 :
              'unknown';
  $obj->$method('new '. $value);
  print "$method: ". $obj->$method. "\n";
}

