#!/usr/bin/perl

# http://blog.livedoor.jp/dankogai/archives/50783623.html
# perl - Inside-out Object

# InsideOut オブジェクトは隠蔽化を強制するしくみ
# InsideOut.pm を呼び出す

use strict;
use warnings;
use InsideOut;
use Data::Dumper;

my $o = InsideOut->new();
$o->name("dankogai");
$o->uri("http://blog.livedoor.jp/dankogai/");

my $data = Data::Dumper->new([$o],['object']);
$data->Freezer('name');
my $c = $data->Dump;


print $o->name, ",", $o->uri, "\n";
print Dumper $o;

print $c;

__END__
# output
dankogai,http://blog.livedoor.jp/dankogai/
$VAR1 = bless( do{\(my $o = undef)}, 'InsideOut' );

# accessor を通じてなら インスタンス変数
# ( $objects{sefl+0}{name, $objects{sefl+0}{uri} ) に
# アクセス出きるのに
# Dump したオブジェクトが undef なのがポイント 

InsideOut.pm のオブジェクトは 空 の blessed sclar reference.
Perl のオブジェクトは blessed reference なら何でも OK.

# $self+0 とは ?

簡単なオブジェクトを作って実験
---
$ perl -MCGI -le '$q=CGI->new; printf "%s,%d,0x%x\n",$q,$q+0,$q+0'
CGI=HASH(0x1be4d48),29248840,0x1be4d48
---

リファレンスを数値コンテキストで評価すると *アドレス* が返される !
各リファレンスのアドレスは固有なので, これを ID として使える.
InsideOut.pm の accessor は, この ID を key としたハッシュ %objects に
アクセスしている.

しかし, この %objects はレキシカル変数なので InsideOut.pm の
最も外側のブロック (ファイルもひとつのブロック) の外からは
アクセス出来ない.

このため, 外部 (ここでは insideout.pl) からは accessor を通して
アクセスするしかない.

-> これを %objects の *** 隠蔽化 *** という.

本来 object の中に入っているデータが object の外にあることから,

-> この方式で実装された object を *** inside-Out Object *** と呼ぶ.

ただし, この方式ではデータがオブジェクトの中にないので,
オブジェクトが破棄される場合に, そのオブジェクトに紐づいたデータを
%objects が見えるスコープで処理してやる必要があり,
そのために必ず DESTROY を自前で実装しておく必要がある.

これは Damian Conway お気に入りの方式で, 
これが Class::Std の実装につながった.
Class:;Std は Inside-Out Object にまつわる不便を
まとめて面倒みてくれるモジュール.

