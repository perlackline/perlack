#!/usr/bin/perl

use strict;
use warnings;

# main スコープ
my $ref;
my $other;

# スコープ 01
{
  my $ref2;

  # スコープ 02 
  {
    # オリジナル hello 参照カウント 1
    my $scalar = "hello";

    # コピー hello 参照カウント 1
    $other = $scalar; 

    # オリジナル hello 参照カウント 2
    $ref = \$scalar;
  
    # オリジナル hello 参照カウント 3
    $ref2 = $ref;

    # 3 つの経路からオリジナル hello を参照可能  
    # hello, hello, hello
    print "$scalar, $$ref, $$ref2\n";
  }

  # $scalar からの参照は破棄
  # オリジナル hello 参照カウント 2
  # hello, hello
  print "$$ref, $$ref2\n";

}

# main スコープ

# $ref2 からの参照は破棄
# オリジナル hello 参照カウント 1
# hello
print "$$ref\n";

# コピー hello 参照カウント 1
# hello
print "$other\n";

__END__
# プログラム終了
# オリジナル hello 参照カウント 0
# コピー hello 参照カウント 0

