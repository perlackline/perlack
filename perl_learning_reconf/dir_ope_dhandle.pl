#!/usr/bin/perl
# ディレクトリ操作
use strict;
use warnings;

my $dir = '/tmp';
opendir my $dh, $dir or die "Cannot open $dir: $!";

foreach my $file (sort (readdir $dh)) {
  print "$file\n";
}

closedir $dh;
