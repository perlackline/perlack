#!/usr/bin/perl

use strict;
use warnings;

print "\n--- Symlink in the current dir ---\n";

foreach my $file (glob '*') {

  # $BBP>]$,(B symlink $B$J$i=hM}$9$k(B
  if ( -l $file ) {

    my $destination =  readlink "$file"
      or warn "Can't read symlink for $file:$!";
    print "$file -> $destination\n"
  }

}

print "\n";
