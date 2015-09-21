#!/usr/bin/perl

use strict;
use warnings;
use feature 'say';

sub ban {
  if (wantarray) {
    return (2, 3, 1);
  } else {
    1;
  }
}

my $foo = 1 + ban();
say "foo: $foo";

my @sort = sort (ban());
say "sort: @sort";

$foo = 1 . ban();
say "foo: $foo";



