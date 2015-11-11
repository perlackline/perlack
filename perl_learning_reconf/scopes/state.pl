#!/usr/bin/perl

use strict;
use warnings;
use 5.010;

sub counter {
  state $count;
  ++$count;
}

foreach (0..2) {
  print counter(), "\n";
}

