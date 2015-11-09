#!/usr/bin/perl

use strict;
use warnings;

# Geek なページ 簡単なTCPサーバとクライアント
# http://www.geekpage.jp/programming/perl-network/simple-tcp.php
# TCP クライアント

use IO::Socket;

my $sock = new IO::Socket::INET(
                # 通信相手のアドレス
                PeerAddr => 'localhost',
                # 通信相手の待受ポート
                PeerPort => 12345,
                # 通信プロトコル
                Proto => 'tcp');

die "IO::Socket : $!" unless $sock;

print <$sock>;

close($sock);

