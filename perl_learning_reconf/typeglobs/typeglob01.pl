#!/usr/bin/perl

use strict;
use warnings;

our $num = 1;

sub func{
  return 2;
}

print "1: シンボルテーブルを覗く\n";

require Data::Dumper;
print Data::Dumper->Dump([\%main::],[qw( *main:: )]), "\n";

print "2: main パッケージの num と func の内容を見る\n";

print $main::{ num }, "\n";
# main は省略可能
print $::{ num }, "\n";

print $main::{ func }, "\n";
print $::{ func }, "\n\n";

print "3: シンボルテーブルから変数の値を取得する\n";

# ${} で囲むとスカラ値を取得可能
my $num_by_symbol = ${$main::{ num }};
print "$num_by_symbol\n";

