#!/usr/bin/perl

use strict;
use warnings;

my $file = shift;

my $status = stat($file);
print $status, "\n";

if ( -f _ ) {
  print "It's file\n";
}

my $size = -s _;

print "size: $size\n";
