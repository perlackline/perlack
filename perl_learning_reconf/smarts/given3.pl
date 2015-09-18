#!/usr/bin/perl

use 5.010001;

use strict;
use warnings;

#my $greeting = 'Good morning.';
my $greeting = 'How was your today?';
#my $greeting = 'good afternoon.';
#my $greeting= 'good evening.';

given ($greeting) {
  when ( 'Good morning.' ) { say 'Full match'; continue }
  when ( /morning/ ) { say 'Partial match: morning' }
  default { say 'default' }
}


