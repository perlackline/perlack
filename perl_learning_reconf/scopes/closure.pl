#!/usr/bin/perl

use strict;
use warnings;

sub outer {
  my $count = 1;
  sub {
    print "$count\n";
    $count = $count + 1;
  };
}

# outer() を呼び出して無名サブルーチンのコードレフを格納。
# この時のコードレフが「 クロージャ 」。
my $x = outer();
my $y = outer();

# $x からクロージャを呼び出し
foreach (0..2){
  $x->();
}

print "---\n";

# $y からクロージャを呼び出し
foreach (0..2){
  $y->();
}

