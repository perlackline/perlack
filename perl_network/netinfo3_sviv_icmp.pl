#!/usr/bin/perl

use strict;
use warnings;

# ホストの生存確認（Net::Ping）
# http://www.geekpage.jp/programming/perl-network/net-ping.php
# Net::Ping を利用して対象機器が動作しているかを確認する
# 疎通確認に ping と同じ ICMP を利用する方法
# 実効には root 権限が必要

use Net::Ping;

# 確認対象のホスト名または IP アドレス
my $dest = "google.co.jp";
#my $dest = "localhost";

# ICMP を利用する
my $p = Net::Ping->new("icmp");

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

