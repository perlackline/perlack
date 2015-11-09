#!/usr/bin/perl

use strict;
use warnings;

foreach my $key ( sort (keys %SIG) ) {
  print "$key : $SIG{$key}\n";
}
