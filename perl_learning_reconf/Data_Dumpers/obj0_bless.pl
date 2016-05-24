#!/usr/bin/perl

# http://d.hatena.ne.jp/chaichanPaPa/20100206/1265436393
# Perlオブジェクト基礎文法最速マスター

# bless

use strict;
use warnings;

my %test_hash = ( aaa => 'XXX', bbb => 'YYY' );
my $test = bless \%test_hash, 'package01';  # リファレンスとパッケージを紐付け

# L.6 で初期化した key aaa の値 XXX を出力
print '-->',$test->{aaa}, '<--', "\n";

# パッケージ package01 のメソッド test01 をコール
$test->test01(3);

# メソッド test01 で上書きした key aaa の値 ZZZ を出力
print '-->',$test->{aaa}, '<--', "\n";

package package01;
sub test01 {
  # $_[0] は %test_hash のリファレンス
  # %test_hash は package01 に紐付けられた blessed hashref
  # $_[1] はコール時の引数 3
  print "第 1 引数は $_[0], 第 2 引数は $_[1].\n";

  # shift されるのは %test_hash の blessed hashref
  my $obj_self = shift;

  # blessed hashref を通して key aaa の値を ZZZ に変更
  $obj_self->{aaa} = 'ZZZ';
}

__END__
-->XXX<--
第 1 引数は package01=HASH(0x1e5bb40), 第 2 引数は 3.
-->ZZZ<--

