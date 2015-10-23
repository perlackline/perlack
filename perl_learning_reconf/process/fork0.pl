#!/usr/bin/perl

use strict;
use warnings;

defined( my $pid = fork ) or die "Cannot fork: $!";

unless ($pid) {

  # child process here
  exec 'date';
  die "cannot exec date: $!";
}

# parent process here
waitpid($pid, 0);
 
