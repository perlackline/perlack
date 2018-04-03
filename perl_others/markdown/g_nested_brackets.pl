#!/usr/bin/perl
use strict;
use warnings;

# (?>
# 出来る限りマッチして, バックトラックをしない
# (??{...})
# 動的正規表現, 戻り値は正規表現として扱われる

# [^\[\]]+
# ブラケット以外のなにか
# |
# または
# \[(??{$g_nested_brackets})\]
# $g_nested_brackets を含むブラケット (再帰的にマッチ)
# eg. [[]], [alphabet], [[others]]

my $g_nested_brackets;
$g_nested_brackets = qr { (?> [^\[\]]+ | \[ (??{ $g_nested_brackets }) \] )* }x;

my $bracket = "[]";
print "found bracket!\n" if ($bracket =~ $g_nested_brackets);
# found

my $brackets = "[[[[[]]]]]";
print "found only brackets!\n" if ($brackets =~ $g_nested_brackets);
# found

my $others = "[[abc123]]";
print "found barakets and others!\n" if ($others =~ $g_nested_brackets);
# found



