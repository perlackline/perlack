#!/usr/bin/perl

use strict;
use warnings;

use People;

# 外部の変数
print "scalar: $modules_scalar\n";
print "array : @modules_array\n";
print "hash  : $_ : $modules_hash{$_}\n" for keys %modules_hash;

print "---\n";
# 外部のサブルーチン
set_name('Bellri');
my $name = get_name();
print "That name is $name\n";

