#!/usr/bin/perl

use strict;
use warnings;

# ホストの生存確認（Net::Ping）
# http://www.geekpage.jp/programming/perl-network/net-ping.php
# Net::Ping を利用して対象機器が動作しているかを確認する
# 疎通確認は TCP
# 他に UDP, ICMP でも確認可能
# ICMP を利用する場合は ICMP 送受信のための RAW ソケットを開くため
# root 権限が必要
# RTT の計測機能もある

use Net::Ping;

# 確認対象のホスト名または IP アドレス
my $dest = "localhost";

my $p = Net::Ping->new();

# ping を実行
my $result = $p->ping($dest);

# 結果の確認
if ($result) {
  print "$dest is alive\n";
} else {
  print "error\n";
}

# 終了
$p->close();

exit;

