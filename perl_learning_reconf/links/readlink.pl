#!/usr/bin/perl

use strict;
use warnings;

print "\n--- Symlink in the current dir ---\n";

foreach my $file (glob '*') {

  # 対象が symlink なら処理する
  if ( -l $file ) {

    my $destination =  readlink "$file"
      or warn "Can't read symlink for $file:$!";
    print "$file -> $destination\n"
  }

}

print "\n";
