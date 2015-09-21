#!/usr/bin/perl

package KanColle;
use strict;
use warnings;
use feature 'say';

sub login {}

package main;
use strict;
use warnings;
use feature 'say';

while (my ($k, $v) = each %KanColle::) {
  say "$k = $v";
}

