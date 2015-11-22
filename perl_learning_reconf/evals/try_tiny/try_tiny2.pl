#!/usr/bin/perl

use strict;
use warnings;

use Try::Tiny;

# サブルーチン内で die
sub something { die "something's die\n" }
# eval ブロックで die
eval { die "eval's die\n" };
# グローバルの $_ にデフォルト値をセット
$_ = 'default';

# try/catch/finally
try {
  something();
} catch {
  print "--- catch block ---\n";
  warn "\$_: $_\n";
  warn "\@_: @_\n";
  warn "\$\@: $@\n";
} finally { 
  print "--- finally block ---\n";
  print "\$_: $_\n";
  print "\@_: @_\n";
  print "\$\@: $@\n";
};

print "--- outside of block ---\n";
print "\$_: $_\n";
print "\@_: @_\n";
print "\$\@: $@\n";

