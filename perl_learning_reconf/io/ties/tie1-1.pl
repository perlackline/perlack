#!/usr/bin/perl

use strict;
use warnings;

use Tie::CharArray qw/chars/;
my $f = "jello is yellow";
# 文字列を array ref で格納 
my $chars = chars $f;
foreach (5..28){
  $chars->[$_] = "!";
}

print map{ $_ } @{$chars};
print "\n";

