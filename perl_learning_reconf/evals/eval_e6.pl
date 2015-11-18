#!/usr/bin/perl

use strict;
use warnings;

# http://d.hatena.ne.jp/palmo/20060604/regexp10

sub calculate {
  my $ex = shift;
  1 while ($ex =~ s:(\d+[*/]\d+):$1:ee);
  1 while ($ex =~ s:(\d+[+-]\d+):$1:ee);
  return $ex;
}

my $ex = "10+5*3-10/2";
print calculate($ex);

