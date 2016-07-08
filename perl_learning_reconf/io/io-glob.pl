#!/usr/bin/perl

use strict;
use warnings;

my $file = 'text';
open LOG_FH, ">> $file" or die "could not open $file: $!";

log_message ( *LOG_FH, 'use type-glob');
log_message ( \*LOG_FH, 'use blogref');

sub log_message {
  local *FH = shift;
  #my $fh = shift;
  print FH @_, "\n";
}

