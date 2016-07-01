#!/usr/bin/perl

use strict;
use warnings;

use File::Find;

sub what_to_do {
  print "$File::Find::name found\n";
}

my @starting_directories = qw(.);

find (\&what_to_do, @starting_directories);

