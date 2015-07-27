#!/usr/bin/perl

# ref
# http://d.hatena.ne.jp/perlcodesample/20140325/1395723602

# Mojolicious::Lite の読み込み
# これで use strict と use wartnings が
# 自動で有効になる
use Mojolicious::Lite;

# get 関数でルーティングの設定。
# 第一引数は URL パターン。
# 最後の引数は実行する処理。
# 実行する処理は無名サブルーチンの
# リファレンスとして記述する。
# 以下は get ( '/', sub{ ... } ) と同じ。
get '/' => sub {

  # コントローラーオブジェクトの取得。
  # (Mojplicious::Controller オブジェクト)
  # HTTP リクエストごとに生成される。
  my $self = shift;

  # コンテンツの描画
  $self->render(text => 'Hello World');

# このサブルーチンをコントローラーと呼ぶ。
# コントローラーは $c と表現する場合がある。
};

# Mojolicious アプリケーションの開始
app->start;

#use Mojolicious::Lite;
#
#get '/' => sub {
#  my $self = shift;
#
#  $self->render(text => 'Hello World');
#};
#
#app->start;
