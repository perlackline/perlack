#!/usr/bin/perl

use strict;
use warnings;

# HTML::TreeBuilderによるパース（解析結果をdump）
# http://www.geekpage.jp/programming/perl-network/html-treebuilder-3.php
# HTTP::Lite と HTTP::TreeBuilder による HTTP クライアント
# HTML を parse して結果を dump する
# データの階層構造がわかるのでデバッグなどで有用

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

# dump
print $tree->dump();

exit;

