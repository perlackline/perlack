#!/usr/bin/perl
# ディレクトリ操作
use strict;
use warnings;

#chdir '..' or die "cannot chdir to /etc: $!";
chdir 'files' or die "cannot chdir to /etc: $!";
#chdir or die "cannot chdir to /etc: $!";

#my @all_file = glob "bit_*{shift,string,chmod}*pl";
#my @all_file = glob "*";
#my @all_file = glob '.* *';
# t の後に任意の 1 文字
#my @all_file = glob 't?est.txt';
# test の後に数字が 1 つ続く
#my @all_file = glob 'test[0-9].txt';
# test_ の次に one, two, three のいずれかが続く
#my @all_file = glob 'test_{one,two,three}*';
# ユーザのホームディレクトリ
#my @all_file = glob '~/*';
my @all_file = glob 'test_[ab]*';

foreach (@all_file) {
  print "$_\n";
}

