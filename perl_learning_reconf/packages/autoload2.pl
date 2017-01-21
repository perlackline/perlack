#!/usr/bin/perl

use strict;
use warnings;

# check AUTOLOAD

my @args = qw( one two three );
unknown(@args);

sub AUTOLOAD {
  our $AUTOLOAD;
  warn "The called subroutine '$AUTOLOAD' (with [@_]) does not exist in this program.\n"; 
} 

