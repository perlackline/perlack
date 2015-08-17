#!/usr/bin/perl

use strict;
use warnings;

use utf8;

use Time::Piece;

# Time::Piece でオーバーライドした localtime で
# オブジェクトを作成。
my $t = localtime;

# フォーマットを準備
my $format = "date: %4d/%02d/%02d";

my $formatted = sprintf $format, $t->year, $t->mon, $t->mday;

print "$formatted\n";

