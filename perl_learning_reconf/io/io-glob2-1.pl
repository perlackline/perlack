#!/usr/bin/perl

use strict;
use warnings;

my $file = 'text';
open LOG_FH, ">> $file" or die "could not open $file: $!";

print \*LOG_FH, "\n";
print *LOG_FH{PACKAGE}, "\n";
print "---\n";

log_message(\*LOG_FH, 'adding text');

sub log_message {
  local *FH = shift;
  print \*FH, "\n";
  print *FH{PACKAGE}, "\n";
  print FH @_,"\n";
}
