#!/usr/bin/perl

use strict;
use warnings;

## ファイル名一括変換 (存在チェックなし)
#foreach my $file ( glob "*.old" ) {
#  # 非破壊置換
#  (my $newfile = $file) =~ s/\.old$/.new/;
#  rename $file, $newfile;
#}

# ファイル名一括変換 (存在チェックあり)
foreach my $file ( glob "*.old" ) {

  (my $newfile = $file) =~ s/\.old$/.new/;
  # ファイルテスト
  if ( -e $newfile ) {
    warn "$newfile already exists.\n";
  } elsif ( rename $file, $newfile ) {
    # 何もしない
  } else {
    warn "rename $file to $newfile faild: $!\n";
  }
}

