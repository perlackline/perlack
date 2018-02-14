#!/usr/local/bin/perl

# http://x68000.q-e-d.net/~68user/net/echo-3.html

use strict;
use warnings;
use Socket;

my $port = 5000;

# Create the socket
socket(CLIENT_WAITING, PF_INET, SOCK_STREAM, 0)
  or die "Could not create the socket: $!";
# Set socket option
setsockopt(CLIENT_WAITING, SOL_SOCKET, SO_REUSEADDR, 1)
  or die "Could not set socket option: $!";
# Assign an address (= name) to the socket
bind(CLIENT_WAITING, pack_sockaddr_in($port, INADDR_ANY))
  or die "Fail to bind: $!";

# Monitor the port
listen(CLIENT_WAITING, SOMAXCONN)
  or die "listen: $!";

print "親プロセス ($$): ポート $port を監視します.\n";

while(1) {
  my $paddr = accept(CLIENT, CLIENT_WAITING);

  # Get hostname, IPaddr, clients portnumber
  my ($client_port, $client_iaddr) = unpack_sockaddr_in($paddr);
  my $client_hostname = gethostbyaddr($client_iaddr, AF_INET);
  my $client_ip = inet_ntoa($client_iaddr);

  print "connect: $client_hostname ($client_ip) port $client_port\n";

  # Create a child process by fork
  if (my $pid = fork()) {
    # Parent here
    print "親プロセス($$): 引き続き $port を監視します.\n";
    print "親プロセス($$): クライアントはプロセス $pid で対応します.\n";

    # Parent closes the socket
    close (CLIENT);
    next;
  }else{
    # Child here

    # No buffering for client
    select(CLIENT); $|=1; select(STDOUT);
    while(<CLIENT>){
      print "子プロセス($$): メッセージ $_";
      # Return message to client
      print CLIENT $_;
    }
    close(CLIENT);
    print "子プロセス($$) の接続が切れました. 終了します.\n";

    # ポートの監視は親プロセスが行っているので
    # クライアントとのやりとりが終わり次第子プロセスは exit
    exit;
  }
}


