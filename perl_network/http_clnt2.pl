#!/usr/bin/perl

use strict;
use warnings;

# HTTPクライアントの作成（HTTP::Liteを利用）
# http://www.geekpage.jp/programming/perl-network/http-lite-0.php
# HTTP::Lite による HTTP クライアント

use HTTP::Lite;

my $http = new HTTP::Lite;

# 指定した URL から HTML を取得
my $req = $http->request("http://pointoht.ti-da.net/e6215627.html") or die $!;

# HTML 全文を出力 (body 要素だけではないすべての要素)
print $http->body();

exit;

