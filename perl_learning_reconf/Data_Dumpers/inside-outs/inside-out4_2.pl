#!/usr/bin/perl

#use strict;
#use warnings;

# http://www.chikkun.com/und/document/perl/inside_out.html
# 変数のスコープからインサイドアウトクラスまで

# パッケージ (ファイル) のスコープ
package Huga;
use Hoge;

my $huga = "chikkun";

package main;

my $instance = Hoge->new();
$instance->printDefault(); # 1

$instance->{default} = 100;
$instance->printDefault(); # 100

print $default, "\n"; # 空行
print $def, "\n";     # 空行
print $huga, "\n";    # chikkun

__END__
1
100
sakai
chikkun
1
100


chikkun

