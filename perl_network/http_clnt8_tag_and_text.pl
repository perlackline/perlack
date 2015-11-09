#!/usr/bin/perl

use strict;
use warnings;

# HTML::TreeBuilderによるパース（タグとテキストを全表示）
# http://www.geekpage.jp/programming/perl-network/html-treebuilder-4.php
# HTTP::Lite と HTTP::TreeBuilder による HTTP クライアント
# HTML を parse して要素名とテキスト情報を抽出する

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

# 要素 body を表現する HTML::Element を取得
my $body_tag = $tree->find('body');
print_element($body_tag);

exit;

# 要素とテキストを再帰的に表示するサブルーチン
sub print_element {
  #my $e = $_[0];
  my $e = shift;

  my @elements = $e->content_list();

  if($#elements < 0){
    # child が 1 つもなければ終了
    return;
  }

  my $i;

  # 各 Element を表示
  for ($i = 0; $i <= $#elements; $i++) {

    # HTML::Element なら要素情報を表示
    if (ref $elements[$i] eq "HTML::Element") {
      print "TAG: " . $elements[$i]->tag . "\n";
      print_element($elements[$i]);

    } else {

      # 文字列として表示
      print "TEXT :\n";
      print $elements[$i], "\n";
    }
  }
}

