#!/usr/bin/perl

use strict;
use warnings;

my $dirname = './';
my @big_old_files;

opendir my $dir, $dirname or die "Cannot open $dirname: $!";
foreach my $filename(readdir $dir) {
  next if $filename =~ /^..?$/;
  push @big_old_files, $filename
    if -s $filename > 1000;
    #if -s $filename > 1000 and -A $filename > 2;
}

print map{ my $size = -s $_; "$_: $size\n" } @big_old_files;
