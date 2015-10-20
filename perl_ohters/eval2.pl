#!/usr/bin/perl

use strict;
use warnings;

# eval の引数にブロックを指定してブロック内で
# 発生した例外エラーの補足を行う。
# (異常終了のハンドリング)
# http://gihyo.jp/dev/serial/01/perl-hackers-hub/000702

eval {
  print "in eval\n";
  #die 'エラー!'; # 例外が発生
  print 'エラー!'; # 例外が発生
};

if ( $@ ) {
  print "year!!\n";
  print "Error: $@\n"; # $@ にエラーメッセージが入る
}

