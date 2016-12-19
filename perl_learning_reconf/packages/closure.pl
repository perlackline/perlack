#!/usr/bin/perl

use strict;
use warnings;

# check destroy
# inside-out object

sub enclose {
  my $enclosable = { key1 => 'val1', key2 => 'val2' };

  # $B%/%m!<%8%c(B
  sub {
    $enclosable;
  }
}

my $coderef = enclose();

# $B%2%C%H(B
print $coderef->()->{key1}, "\n";

# $B%;%C%H(B
$coderef->()->{key1} = 'new_val';

# $B%2%C%H(B
print $coderef->()->{key1}, "\n";
