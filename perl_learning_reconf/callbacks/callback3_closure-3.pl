#!/usr/bin/perl

use strict;
use warnings;

use File::Find;

sub create_find_callbacks_that_sum_the_size {
  my $total_size = 0;
  # 2 つの closure (サイズを加算する, 加算したサイズを返す)
  # これらは同じ $total_size のデータを参照する.
  return(sub{ $total_size += -s if -f },sub{ return $total_size });
}

# 2 つの closure のコードレフをセット
my($count_em,$get_results) = create_find_callbacks_that_sum_the_size();

# find() で見つかったファイルのサイズを sum
find($count_em, '.');

# sum された合計サイズを取得
my $total_size = &$get_results();
print "total size of . is $total_size\n";


