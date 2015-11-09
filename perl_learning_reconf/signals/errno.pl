#!/usr/bin/perl

use strict;
use warnings;

foreach (sort keys %!){
  print "$_: $!{$_}\n";
}

