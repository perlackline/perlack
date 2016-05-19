#!/usr/bin/perl

#use strict;
#use warnings;

# http://www.chikkun.com/und/document/perl/inside_out.html
# 変数のスコープからインサイドアウトクラスまで

# クラス
package Hoge;

# クラスメソッドコンストラクタ
sub new {
  my $class = shift;
  # 無名ハッシュレフを作成
  #my $self = {};

  my $self = { default => 1 };

  # bless したオブジェクトレフを返す
  return bless $self, $class;
  # bless の構文は次のようにも書ける
  # ---
  # bless $slef, $class;
  # return $self;
  # ---
}

sub printDefault {
  my $this = shift;
  print $this->{default}, "\n";
}

package main;

my $instance = Hoge->new();

$instance->printDefault();

__END__
# output
1

