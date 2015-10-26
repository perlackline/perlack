#!/usr/bin/perl
use strict;
use warnings;

print "forking...\n";

my $pid = fork;
die "fork failed." unless defined $pid;

# プログラムが fork

print "forked!\n";

if ($pid == 0){

  # child process
  exec "ruby -e 'loop do; sleep; end'";

} else {

  # parent process
  waitpid($pid, 0);
}


