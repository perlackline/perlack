#!/usr/bin/perl

use strict;
use warnings;

use Data::Dumper;
open my $fh, '<', 'dump.txt' or die "$!";
my $hoge = eval<$fh>;
close $fh;

for my $elm (@{$hoge}){
  print "@{$elm}\n";
}
