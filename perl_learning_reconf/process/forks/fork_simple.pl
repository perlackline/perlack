#!/usr/bin/perl

use strict;
use warnings;

print "I will fork now on...";

defined( my $pid = fork ) or die "Cannot fork: $!";

if ($pid == 0) {

  # child process here
  my $string = 'this is child process!';
  print "$string\n";
  print "child process doen.\n";

} else {

  # parent process here
  waitpid($pid, 0);
  print "parent process done.\n";

}

 
