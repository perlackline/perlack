#!/usr/bin/perl

use strict;
use warnings;

# HTTPクライアントの作成（TCPクライアントサンプル）
# http://www.geekpage.jp/programming/perl-network/simple-http-client.php
# インチキ HTTP クライアント

use IO::Socket;

my $sock =new IO::Socket::INET(
                # 通信するアドレス
                #PeerAddr => 'www.google.co.jp',
                PeerAddr => 'pointoht.ti-da.net',
                # 通信するポート
                PeerPort => 80,
                # 通信するプロトコル
                Proto => 'tcp');

die "IO::Socket : $!" unless $sock;

print $sock "GET / HTTP/1.0\n\n";

print <$sock>;

close($sock);

exit;

