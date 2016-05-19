#!/usr/bin/perl

#use strict;
#use warnings;

# http://www.chikkun.com/und/document/perl/inside_out.html
# 変数のスコープからインサイドアウトクラスまで

# パッケージ (ファイル) のスコープ
package Huga;
use Hoge2;

my $huga = "chikkun";

package main;

my $instance = Hoge2->new();
$instance->printDefault(); # 1 at Hoge2//

$instance->{default} = 100;
$instance->printDefault(); # 100 at Hoge2//

#------------------------------
print $Hoge2::default, "--\n"; # sakai//
print $Geho::def, "--\n";      # chikkun//
Hoge2::printDefault();         #  at Hoge2//
Hoge2->{default}, ">>>>>\n";   # chikkun
#------------------------------
print $huga, "\n";

__END__
1 at Hoge2//
100 at Hoge2//
sakai--
chikkun--
 at Hoge2//
chikkun


