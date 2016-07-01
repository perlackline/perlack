#!/usr/bin/perl

use strict;
use warnings;

use File::Find;

sub print_bigger_than {

  # 入力としての closure 変数
  my $minimum_size = shift;

  # 引数の値以上のサイズのファイルのみ print
  return sub{ print "$File::Find::name\n"
              if -f and -s >= $minimum_size };
}

my $bigger_than_1024 = print_bigger_than(1024);

# ./bin/ 以下で 1024byte 以上のファイルを指定
find( $bigger_than_1024, 'bin');

