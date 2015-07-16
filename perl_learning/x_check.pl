#!/usr/bin/perl

use strict;
use warnings;

# current dir のファイルのうち文字コードが ISO-2022-JP の
# ものを取得する
chomp(my @line = `nkf -g * | grep ISO-2022-JP`);
for (@line) {
  print "$_\n";
}

