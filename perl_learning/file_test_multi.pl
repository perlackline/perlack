#!/usr/bin/perl

use strict;
use warnings;

my $file = shift;
#my $file = $ARGV[0];

open my $fh, '<', "$file" or die "Can't open $file:$!";
if ( -r $fh and -w _ and -x _ ) {
  print "$file is possible read, write and execution\n";
} elsif ( -r _ or -w _ or -x _ ) {
  if ( -r _ ) {
    print "$file is readable.\n";
  }
  if ( -w _ ) {
    print "$file is writable.\n";
  }
  if ( -x _ ) {
    print "$file is executable.\n";
  }
} else {
  print "$file is impossible to r, w and x..\n";
}

