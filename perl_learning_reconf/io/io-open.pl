#!/usr/bin/perl

use strict;
use warnings;

open my $log_fh, ">>", 'log.file' or die "could not open log.file: $!";

log_message ( $log_fh, 'use scalar');

print $log_fh, "\n";
print "---\n";

print *log_fh{SCALAR}, "\n";
print *log_fh{GLOB}, "\n";

sub log_message {
  #local *FH = shift;
  my $fh = shift;
  print $fh @_, "\n";
  #print FH @_, "\n";
}

