#!/usr/bin/perl

#use strict;
#use warnings;

# http://www.chikkun.com/und/document/perl/inside_out.html
# 変数のスコープからインサイドアウトクラスまで

# カプセル化 encapsulate とは

# カプセル化は外部から変更されては困る変数やメソッドを
# クラスの利用側から隠蔽する手法

# Java では
# 基本的に private で隠蔽し, アクセスする必要があれば
# public のメソッドに変更して対応する

# Perl で同様の公開/隠蔽を操作する方法が InsideOut オブジェクト

# InsideOut Object

# closure の特性を利用してこれまでの Perl オブジェクト指向の
# 標準規則をことごとく "ひっくりかえした" (inside-out) オブジェクト


