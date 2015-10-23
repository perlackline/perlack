#!/usr/bin/perl

# process-book
# https://github.com/Shinpeim/process-book/blob/master/002.md

use strict;
use warnings;

print "forking..\n";

# fork システムコールをコール

my $pid = fork;

# $pid が undef なら fork 失敗

die "fork faild." unless defined $pid;

# -- fork 成功 --

# ここから parent と child の process が
# *別々の環境* で *同じこのプログラム* を
# *同時に* 実行する。

print "forked!\n";

# fork された child は fork の返り値が 0 に
# parent には child の process ID になるので
# これを利用して条件分岐。

if ($pid == 0) {

  # child 用の処理
  # exec で perl の process を
  # ruby の process に書き換える。

  exec q/ ruby -e 'puts "I am ruby"' /; 
  #exec "ruby -e 'loop do; sleep; end'";  

  #print "I'm child process...\n";
  #die $!;

} else {

  # parent 用の処理

  print "I'm parent process...\n";

  # 子プロセスの終了を待つ
  waitpid($pid, 0);

  print "all done from parent.\n";
}

