#!/usr/bin/perl

use strict;
use warnings;

print "\n--- Delete symlink ---\n";

foreach my $file (glob '*') {

  # 対象が symlink なら処理
  if ( -l $file ) {
    print "$file\n";
    unlink $file
      or warn "cannot unlink file: $!";
  }

}

print "\n";

