#!/usr/bin/perl

# cap14 q (P193) の answer (P286)

# AUTOLOAD メソッドを持つ MyDate モジュール。

# AUTOLOAD は day, month, year の名前のメソッドに対す
# る処理を行い適切な値を返す。

# 他のメソッドに対してはメソッド名が分からない旨の警告
# メッセージを carp で出力する。

# また, このモジュールを使って日, 月, 年の値を出力する
# スクリプトを書く。

use strict;
use warnings;

{
  package MyDate;
  use vars qw($AUTOLOAD);

  use Carp;

  # date=>3, month=>4, year=>5 のハッシュ。
  # localtime のスライスインデックスに各 value を使う。
  my %Allowed_methods = qw( date 3 month 4 year 5 );

  # localtime の値のオフセットに使う。
  my @Offsets         = qw( 0 0 0 0 1 1900 0 0 0 );

  # { } は空の無名ハッシュ。
  # $_[0] は最初の引数 = @_ のインデックス 0。
  sub new     { bless { }, $_[0] }
  sub DESTROY { }

  # P188 AUTOLOAD は元のメソッドの代わりに呼び出される。
  # 引数は通常どおり。
  # クラス名かインスタンスリファレンスが先頭。
  # 続いてメソッド呼び出しに渡された引数リストが続く。
  sub AUTOLOAD {

  # AUTOLOAD サブルーチンは本来実行すべき処理を実行した
  # りサブルーチンをインストールしてジャンプできる。

		# もとのメソッド名は $AUTOLOAD に格納されている。
        # $AUTOLOAD は AUTOLOAD がコンパイルされたパッ
        # ケージ属するパッケージ変数。
        my $method = $AUTOLOAD;

		# $AUTOLOAD にはメソッド名が完全な形で格納されて
		# いるので 2 重コロンまでをすべて取り除く。
        # パッケージ名を取り除く
        $method =~ s/.*:://;

        # メソッド名が存在しなければ carp でメッセージを出力
        # して終了。
        unless( exists $Allowed_methods{ $method } ) {
            carp "Unknown method: $AUTOLOAD";
            return;
        }

        # key のメソッド名から value のインデックスを取り出す。
        my $slice_index = $Allowed_methods{ $method };

        # localtaime の値を配列のスライスで取り出しつつ
        # その値にオフセット値をプラスして return。
        return (localtime)[$slice_index] + $Offsets[$slice_index];
  }
}

# main 空間にシンボルを導入するために import を利用。
MyDate->import;    # 私たちはこれを使わない

# Mydate のオブジェクトを作成

# Mydate のオブジェクトを作成。
my $date = MyDate->new( );

print "The date is "  . $date->date  . "\n";
print "The month is " . $date->month . "\n";
print "The year is "  . $date->year  . "\n";

