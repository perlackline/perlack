#!/usr/bin/perl

# http://hatyuki.hatenablog.jp/entry/20060608/1149771934
use strict;
use warnings;
#use utf8;
use Carp (); 
use Encode ();
use IO::Socket;

# 接続先の入力待ち
print 'Please enter peer> ';
my $peer = <STDIN>;
chomp ($peer);

print "hello, this is client!\n";

my $socket = IO::Socket::INET->new(
  PeerAddr => $peer,  # 接続先
	PeerPort => 5000,   # Port 番号
	Proto    => 'tcp',  # Protocol
	Timeout  => 5       # タイムアウト時間
);
Carp::croak "Could not create socket: $!" unless $socket;

my $encoder = Encode::find_encoding('UTF-8');
Carp::croak "Could not create Encode obj: $!" unless $encoder;

while(1) {
  # メッセージ入力待ち
  print '> ';
  my $msg = <STDIN>;
  
  # Perl 内部用 Flagged utf8 にデコード
  $msg = $encoder->decode($msg);
  Carp::croak "encoding $msg not found: $!" unless $msg;
  print "msg: $msg";
  
  # 行末の改行を削除
  $msg =~ s/\x0D?\x0A?$//;
  
  # 外部用にエンコードしつつサーバに送信
  print $socket $encoder->encode($msg), "\n";
  
  # Socket からメッセージを受信
  $msg = <$socket>;
  
  # Perl 内部用 Flagged utf8 にデコード
  $msg = $encoder->decode($msg);
  
  # 外部用にエンコードしつつ表示
  print $encoder->encode($msg);
  
  # QUIT or quit 受信で終了
	$msg =~ s/Server>>//; 
  if ($msg =~ m/^QUIT$/i) {
    $socket->close;
  	print "Connection closed by foreign host.\n";
  	last;
  }
}  
print "bye!\n";

