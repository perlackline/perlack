#!/usr/bin/perl

use strict;
use warnings;

#my $retune = kill 'SIGKILL', 8211 or die "Cannot signal 8211 with SIGINT: $!";
#kill 'INT', 8067 or die "Cannot signal 8067 with SIGINT: $!";

#print "$retune\n";

my $pid = 8211;
unless (kill 0, $pid){
  warn "$pid has gone away";
}

