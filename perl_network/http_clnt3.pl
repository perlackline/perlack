#!/usr/bin/perl

use strict;
use warnings;

# HTTP_USER_AGENTを変更したHTTPクライアント（LWP::UserAgent）
# http://www.geekpage.jp/programming/perl-network/lwp-useragent-0.php
# LWP::UserAgent による HTTP クライアント

use LWP::UserAgent;

# HTTP_USER_AGENT の名前を MyUserAgent にする
#my $ua = LWP::UserAgent->new(agent => "MyUserAgent");
my $ua = LWP::UserAgent->new(agent => "Mozilla/5.0");

# HTTP method GET で HTTP リクエストを送信
my $resp = $ua->get("http://pointoht.ti-da.net/");

# 結果を表示
print $resp->content;

exit;

