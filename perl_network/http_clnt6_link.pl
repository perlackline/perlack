#!/usr/bin/perl

use strict;
use warnings;

# HTML::TreeBuilderによるパース（リンクの取得）
# http://www.geekpage.jp/programming/perl-network/html-treebuilder-2.php
# HTTP::Lite と HTTP::TreeBuilder による HTTP クライアント
# 取得した HTML を parse して要素 a のリンク URL のみを取得する

use HTTP::Lite;
use HTML::TreeBuilder;

my $http = new HTTP::Lite;

# URL を指定して HTML を取得
my $req = $http->request("http://pointoht.ti-da.net/e8097574.html") or die $!;

# ページの HTML をすべて取得
my $body = $http->body();

# HTML を parse
my $tree = HTML::TreeBuilder->new;
$tree->parse($body);
$tree->eof();

# 要素 a を取得しつつ
# 要素 a の atribute href のみを出力する
foreach my $link ($tree->find("a")){
  print $link->attr('href'), "\n";
  #print $link->as_HTML, "\n";
}

exit;

