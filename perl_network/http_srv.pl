#!/usr/bin/perl

use strict;
use warnings;

# Geek なページ HTTPサーバの作成（TCPサーバサンプル）
# http://www.geekpage.jp/programming/perl-network/simple-http-serv.php
# インチキ HTTP サーバ

use IO::Socket;

my $sock0 =new IO::Socket::INET(
                # listen のための queue サイズ
                Listen => 5,
                # アドレスとして bind する
                LocalAddr => 'localhost',
                # 利用するポート
                LocalPort => 80,
                # 利用するプロトコル
                Proto => 'tcp',
                # SO_REUSEADDR を有効化
                Reuse => 1 );

die "IO::Socket : $!" unless $sock0;

my $sock = $sock0->accept();

<$sock>;

print $sock "HTTP/1.0 200 OK\n";
print $sock "Cntent-Type: text/html\n";
print $sock "Cntent-Length: 7\n";
print $sock "\n";

print $sock "HELLO perl server\n";

close($sock);
close($sock0);

exit;

