#!/usr/bin/perl

use strict;
use warnings;

my $string   = "She sells sea shells by the seashore. The shells she sells are surely seashells. So if she sells shells on the seashore, I'm sure she sells seashore shells.";
my $part     = "she";

# 文字列の末尾より後ろを指定
my $position = 999;

my $where = 0;
my $cnt   = 0;

print "\n--- 'she' position is ---\n"; 

while ($where >= 0) {

  # index の代わりに rindex を利用する
  $where  = rindex($string, $part, $position);
  next if $where < 0;
  print "$where\n";

  # position を index と逆方向にオフセットする
  $position = $where - 1;
  $cnt++;

}

print "number of pieces: $cnt\n";

print "--- end string ---\n\n";

