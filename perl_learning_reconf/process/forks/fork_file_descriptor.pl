#!/usr/bin/perl

use strict;
use warnings;

# ファイルディスクリプタ（file descriptor）について調べてみた
# http://kotaroito.hatenablog.com/entry/20120108/1326030769

print $$;
my @filehandlers;

for ( 1..10) {
  open my $fh, '<', './input.txt' or die $!;
  push @filehandlers, $fh;
}

sleep 30;

for ( @filehandlers ) {
  close ($_) or warn $!;
}


