#!/usr/bin/perl

use strict;
use warnings;

my $int_count = 0;
#sub my_int_handler { $int_count++ }
#$SIG{'INT'} = 'my_int_handler';

$SIG{'INT'} = sub { $int_count++ };

my $count = 0;
while (1) {
  print "$count\n";
  $count++;
  sleep 1;
  if ($int_count) {
    print "[processing interrupted...]\n";
    last;
  }
}

print "Escaped the while loop\n";
