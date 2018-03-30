#!/usr/local/bin/perl
# http://x68000.q-e-d.net/~68user/net/echo-2.html
use strict;
use warnings;

# Id: echo-server.pl, v1.2

use Socket;

# 1023 以下のポートは root のみ bind 可
my $port = 5000;

# ソケット生成
socket(CLIENT_WATING, PF_INET, SOCK_STREAM, 0)
  or die "ソケットを生成できません: $!";

# ソケットオプション設定
# なんらかの理由でサーバ側から接続が切れた場合の TIME_WAIT による bind 出来ない時間を回避する
setsockopt(CLIENT_WATING, SOL_SOCKET, SO_REUSEADDR, 1)
  or die "setsocketopt に失敗しました: $!";

# ソケットにアドレス (= 名前) をつける
# ソケットとポート番号を結び付ける (bind)
bind(CLIENT_WATING, pack_sockaddr_in($port, INADDR_ANY))
  or die "bind に失敗しました: $!";

# ポートを見張る
listen(CLIENT_WATING, SOMAXCONN)
  or die "listen: $!";

print "ポート $port を監視します\n";

# while(1) で, 1 つの接続が終わっても次の接続に備える
while(1) {

  # クライアントが接続してくるまでここで処理待ち
  # $paddr はホスト名とポート番号をまとめた構造体
  my $paddr = accept(CLIENT, CLIENT_WATING);

  # get hostname, ip addr, port num of client
  # $paddr をポート番号と IP アドレスの構造体に分解する
  my ($client_port, $client_iaddr) = unpack_sockaddr_in($paddr);
  my $client_hostname = gethostbyaddr($client_iaddr, AF_INET);
  my $client_ip = inet_ntoa($client_iaddr);

  print "connect: $client_hostname ($client_ip), port: $client_port\n";

  # no bufferring for client
  select(CLIENT); $| = 1; select(STDOUT);

  while(<CLIENT>) {
    print "メッセージ: $_";
    # return message to client
    print CLIENT $_;
  }
  close(CLIENT);

  print "接続が切れました. 引き続きポート $port を監視します.\n";
}



