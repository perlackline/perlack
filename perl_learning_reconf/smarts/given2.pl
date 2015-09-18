#!/usr/bin/perl

use 5.010001;

use strict;
use warnings;

my @what = 'a'..'z';
my $chr = 'b';
say "@what";

given ($chr) {
  when ( @what ) { say "contain \@what"; continue }
  when ( 'b' )   { say "contain 'b'"; continue }
  when ( 'z' )   { say "contain 'z'"; }
  default        { say 'Don\'t contain.' }
}

say "--- ---";

my $name = 'Alfred';

given ($name) {
  when ( 'Alfred' ) { say "Just contain $name"; continue }
  when ( /^Alfred/ ) { say "start with $name"; continue }
  when ( /Frederic/ ) { say "cotain fred." }
  default { say "Not see a Alfred" }
}
