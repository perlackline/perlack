#!/usr/bin/perl

use strict;
use warnings;

# check destroy
# inside-out object

sub enclose {
  my $enclosable = { key1 => 'val1', key2 => 'val2' };

  # クロージャ
  sub {
    $enclosable;
  }
}

my $coderef = enclose();

# ゲット
print $coderef->()->{key1}, "\n";

# セット
$coderef->()->{key1} = 'new_val';

# ゲット
print $coderef->()->{key1}, "\n";
