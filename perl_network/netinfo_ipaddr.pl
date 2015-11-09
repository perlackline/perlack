#!/usr/bin/perl

use strict;
use warnings;

# IPアドレス一覧を取得（IO::Interface::Simpleを利用）
# http://www.geekpage.jp/programming/perl-network/get-ipaddr.php
# IO::Interface::Simple を利用して IP address 一覧を取得する

use IO::Interface::Simple;

# ネットワークインタフェース一覧を取得
my @ifs = IO::Interface::Simple->interfaces;

# 取得した情報を出力
foreach ( @ifs ) {
  print $_->address, "\n";
}

exit;

