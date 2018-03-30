#!/usr/bin/perl

use strict;
use warnings;

# http://hatyuki.hatenablog.jp/entry/20060608/1149771934 
#use utf8;
use Carp ();
use Encode ();
use IO::Socket;

my $port = 5000;

my $server_socket = IO::Socket::INET->new(
  #LocalPort => 5000,   # Port 番号
  LocalPort => $port,   # Port 番号
  Proto     => 'tcp',  # Protocol
  Listen    => 1,      # Listen する数
  ReuseAddr => 1,      # setsockopt(SO_REUSEADDR, 1) と同じ
);

Carp::croak "Could not create socket: $!" unless $server_socket;
my $encoder = Encode::find_encoding('UTF-8');
Carp::croak "Could not create Encode obj: $!" unless $encoder;

print ">> Port $port を監視します (終了する場合は ^C)\n";

while (1) {
  # クライアントからの接続受付
  my $client_socket = $server_socket->accept;

  # シグナルハンドラ ^C の受信で die
  $SIG{'INT'} = sub {
                      $server_socket->close;
                      print ">> Server socket closed.\n";
                      die "interrupted, exiting...\n";
                    };

  # ?? Is this necessary ? 
  while (my $msg = <$client_socket>) {
    # Flagged utf8 にデコード
    $msg = $encoder->decode($msg);

    # 行末の改行を削除
    $msg =~ s/\x0D?\x0A?$//;

    # 受信した文字列をエンコードして表示, クライアントへ送信
    print 'Client>>', $encoder->encode($msg), "\n";
    print $client_socket 'Server>>', $encoder->encode($msg), "\n";

    # QUIT or quit 受信で終了
    if ($msg =~ m/^QUIT$/i) {
      print ">> Client connection closed.\n";
      print "Continue monitoring port 5000.\n";
      # Socket をクローズ
      $client_socket->close;
      last;
    }
  }
}






