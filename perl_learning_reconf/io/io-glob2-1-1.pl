#!/usr/bin/perl

use strict;
use warnings;

my $file = 'text';
open LOG_FH, ">> $file" or die "could not open $file: $!";

print *LOG_FH{IO}, "\n";
print *LOG_FH{GLOB}, "\n";
print *LOG_FH{NAME}, "\n";
print *LOG_FH{PACKAGE}, "\n";

print "---\n";

log_massage (*LOG_FH, 'adding massage');
log_massage (*LOG_FH{IO}, '{IO}');
log_massage (*LOG_FH{GLOB}, '{GLOB}');
log_massage (*LOG_FH{NAME}, '{NAME}');
#log_massage (LOG_FH, 'sinply string');

sub log_massage {
  local *FH = shift;
  print FH @_, "\n";
}

