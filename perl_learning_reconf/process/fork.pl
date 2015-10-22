#!/usr/bin/perl

use strict;
use warnings;

defined( my $pid = fork ) or die "Cannot fork: $!";

print "0 pid: $pid\n";

unless ($pid) {

  print "1 pid: $pid\n";

  # child process here
  my $string = 'this is child process!';
  print "$string\n";
  system 'echo', "Hello, I'm child :-) A bit sleepy ...";
  system 'sleep', '5';
  print "child process doen.\n";

}

print "2 pid: $pid\n";

# parent process here
waitpid($pid, 0);

print "\$?: $?\n";
print "\${^CHILD_ERROR_NATIVE}: ${^CHILD_ERROR_NATIVE}\n";

print "parent process done.\n";
 
