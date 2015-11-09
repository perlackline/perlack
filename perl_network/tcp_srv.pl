#!/usr/bin/perl

use strict;
use warnings;

# Geek なページ 簡単なTCPサーバとクライアント
# http://www.geekpage.jp/programming/perl-network/simple-tcp.php
# TCP サーバ

use IO::Socket;

my $sock0 =new IO::Socket::INET(
                # listen のための queue サイズ
                Listen => 5,
                # アドレスとして bind する
                LocalAddr => 'localhost',
                # 利用するポート
                LocalPort => 12345,
                # 利用するプロトコル
                Proto => 'tcp',
                # SO_REUSEADDR を有効化
                Reuse => 1 );

die "IO::Socket : $!" unless $sock0;

my $sock = $sock0->accept();

print $sock "HELLO\n";

close($sock);
close($sock0);

exit;

