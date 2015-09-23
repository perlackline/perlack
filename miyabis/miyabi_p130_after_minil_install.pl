#!/usr/bin/perl

# Before 'minil install'
#use FindBin;
#use lib "$FindBin::Bin/Avalon-Emperor/lib";

# After 'minil install'
# This just okay.
use Avalon::Emperor;

use strict;
use warnings;
use feature 'say';

# オブジェクトの初期化
my $emperor = Avalon::Emperor->new(
    hp => 2000,
    mp => 400,
    attack => 1400,
);

# メソッドの呼び出し (ゲッター)
say "get hp  ", $emperor->get_hp;     # 2000
say "get mp  ", $emperor->get_mp;     # 400
say "get atk ", $emperor->get_attack; # 1400

# メソッドの呼び出し (セッター)
say "set  hp->", $emperor->set_hp(4000);     # 4000
say "set  mp->", $emperor->set_mp(500);      # 500
say "set atk->", $emperor->set_attack(2300); # 2300

# メソッドの呼び出し (ゲッター)
say "get hp  ", $emperor->get_hp;     # 4000
say "get mp  ", $emperor->get_mp;     # 500
say "get atk ", $emperor->get_attack; # 2300

# 必殺技
say "final strike: ", $emperor->final_strike;
say "bull crash  : ", $emperor->bull_crash;
say "tomahawk    : ", $emperor->tomahawk;
say "sky drive   : ", $emperor->sky_drive;

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

