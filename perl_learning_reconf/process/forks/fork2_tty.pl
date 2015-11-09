#!/usr/bin/perl

use strict;
use warnings;

{
  my $ttyno = 1;
  sub DB::get_fork_TTY {
    $DB::fork_TTY = "/dev/pts/" . $ttyno++;
  }
}

defined( my $pid = fork ) or die "Cannot fork: $!";

unless ($pid) {

  # child process here
  my $string = 'this is child process!';
  print "$string\n";
  #system 'echo', "Hello, I'm child :-) A bit sleepy ...";
  #system 'sleep', '5';
  print "child process done.\n";

}

# parent process here
waitpid($pid, 0);

print "parent process done.\n";
 
