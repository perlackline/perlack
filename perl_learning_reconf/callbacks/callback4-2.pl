#!/usr/bin/perl

use strict;
use warnings;

my @files = <'bin/*'>;

print "$_\n" for @files;
for my $file (@files){
  my $mtime = (stat $file)[9];
  my $when = localtime $mtime;
  print "$when: $file\n";
}
