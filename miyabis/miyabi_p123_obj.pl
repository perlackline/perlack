#!/usr/bin/perl

# before 'minil install'
use FindBin;
use lib "$FindBin::Bin/Avalon-Emperor/lib";
use Avalon::Emperor;

use strict;
use warnings;
use feature 'say';

my $emperor = Avalon::Emperor->new;

# ==========================================
# Perl のオブジェクト指向

# クラスという概念がない。
# パッケージとリファレンスでクラスと同じことを実現。

# Perl オブジェクト指向は
# パッケージとリファレンス, サブルーチンの 3 つで成り立つ。

# 1. パッケージを作成。
# 2. new メソッドでリファレンスとパッケージ名を bless する。
# 3. パッケージにメソッドを書く。
# 4. モジュールをインストール。
# 5. new メソッドを呼んでオブジェクトを作成。
# 6. オブジェクトに対してメソッドを呼び出す。

# モジュール Avalon::Emperor の作成へ。
# ---
# minil new Avalon::Emperor
# ---
#






