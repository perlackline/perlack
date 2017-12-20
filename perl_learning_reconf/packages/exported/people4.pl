#!/usr/bin/perl

use strict;
use warnings;

#use People;
#use People3 qw( :num :alp );
use People3 qw( :all );

# People のサブルーチンを利用する

print func1(), "\n";
print func2(), "\n";
print func_a(), "\n";
print func_b(), "\n";

my @failed_symbole = People3->export_fail(qw/foo bar baz/);

print "$_\n" for @failed_symbole;
