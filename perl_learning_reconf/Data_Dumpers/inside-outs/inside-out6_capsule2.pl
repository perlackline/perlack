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

# InsideOut オブジェクトの理解のためにクロージャ closure を
# 確認する

# クロージャ Closure

# Perl の closure は
# (サブルーチンそれ自身の) 外部で宣言されたレキシカル変数を表すに過ぎない

# 通常は次のような意味で closure を使う

{
  my $name = "chikkun";
  sub printName {
    print $name, "///\n";
  }
}

print $name, "//\n";

&printName;

$name = "sakai---\n";

&printName;

__END__
# output
//
chikkun///
chikkun///

