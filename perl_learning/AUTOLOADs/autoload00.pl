#!/usr/bin/perl

use strict;
use warnings;

# -- AUTOLOAD --
# sub AUTOLOAD を定義しておくと未定義の関数の呼び出しがあった場合に
# 代替の関数として sub AUTOLOAD が呼び出される。
# http://d.hatena.ne.jp/perlcodesample/20080709/1215622869

# OO の各種メソッドも関数 (subroutine) なので、
# 未定義の package method にも同様に利用可能。

print "-- Calling AUTOLOAD --\n";

# 未定義の関数
aaaaiiii( 1,2 );

sub AUTOLOAD {

  # 元の関数名が格納される特殊変数
  our $AUTOLOAD;

  # 引数も取得可能
  my @args = @_;
  print "This is a AUTOLOAD\n";
  print "Called function name *$AUTOLOAD*\n";
  print "Set args was ", join(',', @args), "\n";
}
