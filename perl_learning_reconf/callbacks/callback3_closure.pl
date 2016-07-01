#!/usr/bin/perl

use strict;
use warnings;

use File::Find;

# ファイルのサイズを格納
my $total_size = 0;

# 見つかったものがファイルなら -f, サイズを返す-s
# 返されたサイズを合計 +=
find(sub{ $total_size += -s if -f}, '.');
print $total_size, "\n";

