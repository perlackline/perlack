#!/usr/bin/perl
use strict;
use warnings;

my $g_nested_parens;

# URL にマッチさせるための regx

# [^()\s]+
# parens (), 空白 \s 以外にマッチ
# \((??{$g_nested_parens})\)
# () に囲まれた何かにマッチ
$g_nested_parens = qr{ (?> [^()\s]+ | \((??{ $g_nested_parens })\) )* }x;

my $parens = "((()))";
print "found parens!\n" if ($parens =~ $g_nested_parens);

my $others = "(http://foo/bar/baz)";
print "found parens and others!\n" if ($parens =~ $g_nested_parens);
