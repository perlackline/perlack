#!/usr/bin/perl

# Emperor を継承した Wizard
use Avalon::Wizard;

use strict;
use warnings;
use feature 'say';

# Wizard オブジェクトの初期化
my $wizard = Avalon::Wizard->new(
    hp => 200,
    mp => 1000,
    attack => 50,
);

# Wizard パッケージのメソッド
$wizard->fire;
$wizard->blizzard;
$wizard->thunder;
$wizard->cure;

# Emperor メソッドの呼び出し (ゲッター)
say "get hp  ", $wizard->get_hp;     # 200
say "get mp  ", $wizard->get_mp;     # 1000
say "get atk ", $wizard->get_attack; # 50

# Emperor メソッドの呼び出し (セッター)
say "set  hp->", $wizard->set_hp(4000);     # 4000
say "set  mp->", $wizard->set_mp(500);      # 500
say "set atk->", $wizard->set_attack(2300); # 2300

# Emperor の必殺技
say "final strike: ", $wizard->final_strike;
say "bull crash  : ", $wizard->bull_crash;
say "tomahawk    : ", $wizard->tomahawk;
say "sky drive   : ", $wizard->sky_drive;

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

