#!/usr/bin/perl

#use strict;
use warnings;

my $file = 'text';
open LOG_FH, ">> $file" or die "could not open $file: $!";

log_message 

print "---\n";

sub log_message {
  #local *FH = shift;
  my $fh = shift;
  #print FH @_, "\n";
  print $fh @_, "\n";

  print "in sub\n";
  print $fh, "\n";
}

