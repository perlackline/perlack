#!/usr/bin/perl

use strict;
use warnings;

use Try::Tiny;

my $x;
my $result;
try {
  print "inside try\n";
  $result = 2/0 or die "foo";
  
  #die "foo\n";
} catch { warn "Got a die: $_"
} finally { $x = 'bar' };

print "x: $x\n";
print "result: $result\n";

