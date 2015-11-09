#!/usr/bin/perl

use strict;
use warnings;

$SIG{'INT'} = sub { 
  my ($sig) = @_; 
  print "Caught a SIG$sig--shutting down\n";
  exit(0);
};

my $count = 0;
while (1) {
  print "$count\n";
  $count++;
  sleep 1;
}

print "Escaped the while loop\n";
