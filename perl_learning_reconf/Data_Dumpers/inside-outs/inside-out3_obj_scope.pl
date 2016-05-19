#!/usr/bin/perl

use strict;
use warnings;

# http://www.chikkun.com/und/document/perl/inside_out.html
# 変数のスコープからインサイドアウトクラスまで

# クラスのスコープ
package Hoge;

# クラスメソッドコンストラクタ
sub new {
  my $class = shift;
  my $self = { default => 1 };

  # bless したオブジェクトレフ $slef を返す
  return bless $self, $class;
}

sub printDefault {
  my $this = shift;
  print $this->{default}, "\n";
}

package main;

my $instance = Hoge->new();
$instance->printDefault(); # 1

# Hoge クラスのメソッド printDefault の値 ($self の値) を
# 上書き出来てしまう
# 現状ではこの上書きを防止することは出来ない
$instance->{default} = 100;
$instance->printDefault(); # 100

# それどころか、次のように任意の key/value を
# クラス (package) の外部で設定出来てしまう
# 何の警告も発生せずにデータはメモリ上に確保される
$instance->{dedefault} = 1000;
print $instance->{dedefault}, "\n"; # 1000

# こうした事態を避ける代表的な方法として
# ***InsideOut オブジェクト***がある

__END__
# output
1
100
1000
