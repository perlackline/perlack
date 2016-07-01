#!/usr/bin/perl

use strict;
use warnings;

use File::Find;

my @starting_directories = qw(.);

# 名前付き sub を無名して直接引数に指定
find (
  sub {
    print "$File::Find::name found\n";
  },
  @starting_directories
);

