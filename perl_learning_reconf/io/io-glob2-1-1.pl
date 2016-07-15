#!/usr/bin/perl

#use strict;
use warnings;

my $file = 'text';
open LOG_FH, ">> $file" or die "could not open $file: $!";

print *LOG_FH{IO}, "\n";
print *LOG_FH{GLOB}, "\n";
print *LOG_FH{NAME}, "\n";
print *LOG_FH{PACKAGE}, "\n";

print "---\n";

# log_message (LOG_FH, 'bare adding message'); # Error by strict subs
log_message (*LOG_FH, 'adding message');
log_message (*LOG_FH{IO}, '{IO}');
log_message (*LOG_FH{GLOB}, '{GLOB}');
log_message (*LOG_FH{NAME}, '{NAME}');
#log_message (LOG_FH, 'sinply string');

print "---\n";

print *LOG_FH, "\n";
print ref *LOG_FH, "\n";


sub log_message {
  #local *FH = shift;
  my $fh = shift;
  #print FH @_, "\n";
  print $fh @_, "\n";

  print "in sub\n";
  print $fh, "\n";
}

