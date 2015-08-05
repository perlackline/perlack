#!/usr/bin/perl

package Oogaboogoo::date2;
use strict;
use Exporter;
our @ISA = qw(Exporter);
our @EXPORT = qw(day mon);
# エクスポートタグのためのコードを追加
# @EXPORT へのリファレンスを直接使っている。
our %EXPORT_TAGS = ( all => \@EXPORT );
# 以下でもエクスポートタグを設定可能
# 新しいコピーを使って 2 つが参照しない方法。
# our %EXPORT_TAGS = ( all => [ @EXPORT ] );

my @day = qw(ark dip wap sen pop sep kir);
my @mon = qw(diz pod bod rod sip wax lin sen kun fiz nap dep);

sub day {
  my $num = shift @_;
  die "$num is not a valid day number"
    unless $num >= 0 and $num <= 6;
  $day[$num];
}

sub mon {
  my $num = shift @_;
  die "$num is not a valid month number"
    unless $num >= 0 and $num <= 11;
  $mon[$num];
}

1;

