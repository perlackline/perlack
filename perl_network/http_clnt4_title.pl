#!/usr/bin/perl

use strict;
use warnings;

# HTML::TreeBuilderによるパース（Titleの取得）
# http://www.geekpage.jp/programming/perl-network/html-treebuilder-0.php
# HTTP::Lite と HTTP::TreeBuilder による HTTP クライアント
# 取得した HTML を parse して title のみを取得する

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

print $tree->find("title")->as_text, "\n";
exit;

