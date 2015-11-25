#!/usr/bin/perl

use strict;
use warnings;
use utf8;
use Encode;

#my @nums = map ( ord, qw/H e l l o/ );
#my @nums = map ( ord, qw/こ ん に ち は/ );

my @nums;
for (qw/H e l l o/){
  push @nums, ord;
}

print "$_\n" foreach @nums;

my @strs = map ( chr, @nums );

print encode('utf-8',$_), "\n" foreach @strs;

