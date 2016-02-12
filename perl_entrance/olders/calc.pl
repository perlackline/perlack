#!/usr/bin/env perl

use strict;
use warnings;

# https://github.com/perl-entrance-org/workshop-2013-05/blob/master/slide.md#%E7%B7%B4%E7%BF%92%E5%95%8F%E9%A1%8C-1

sub calc_string {
  my ($exp) = @_;
  if ( $exp =~ /^(\d)\s?([+\-*%])\s?(\d)$/ ) {
    print $1 + $3, "\n";
  } else {
    undef;
  }
}

calc_string('5 + 8');

