#!/usr/bin/perl

use strict;
use warnings;

print "\n--- Delete symlink ---\n";

foreach my $file (glob '*') {

  # $BBP>]$,(B symlink $B$J$i=hM}(B
  if ( -l $file ) {
    print "$file\n";
    unlink $file
      or warn "cannot unlink file: $!";
  }

}

print "\n";

