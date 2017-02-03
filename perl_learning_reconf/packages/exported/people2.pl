#!/usr/bin/perl

use strict;
use warnings;

#use People;
use People2 qw( set_name get_name );

# People のサブルーチンを利用する

# ゲット
my $name = get_name();
print "That name is $name\n";

# セット
set_name('Bellri');

# ゲット
my $new_name = get_name();
print "That new name is $new_name\n";

