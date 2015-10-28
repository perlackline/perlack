#!/usr/bin/perl

use strict;
use warnings;

{ 
my $ttyno = 1;
sub DB::get_fork_TTY{
    $DB::fork_TTY = "/dev/pts/" . $ttyno++;
}
}

use vars $ttyno;

my $forks = 3;
for my $fork (0..$forks) {
  if (fork) {
   print "parent process.\n";
  }else{
   print "child process.\n";
   $ttyno = $fork;
  }
}

#sub DB::get_fork_TTY {
#  $DB::fork_TTY = "/dev/pts/" . $main::tty;
#}

