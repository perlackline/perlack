#!/usr/bin/perl

use strict;
use warnings;

sub DB::get_fork_TTY {
  open XT, q[3>&1 xterm -title 'Forked Perl debugger' -e sh -c 'tty 1>&3;\ sleep 10000000' |];
  $DB::fork_TTY = <XT>;
  chomp $DB::fork_TTY;
}

defined( my $pid = fork ) or die "Cannot fork: $!";

if ($pid == 0) {

  # child process here
  my $string = 'this is child process!';
  print "$string\n";
  print "child process done.\n";

} else {

  # parent process here
  waitpid($pid, 0);
  print "parent process done.\n";
} 

