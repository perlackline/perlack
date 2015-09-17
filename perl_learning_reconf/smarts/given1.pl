#!/usr/bin/perl

use 5.010001;

use strict;
use warnings;

given ($ARGV[0]) {
  when ( 'Alfred' )   { say 'Name is Alfred'; continue }
  when ( /\AAlfred/ ) { say 'Name starts with Alfred'; continue }
  when ( /alfred/i )  { say 'Name has alfred in it' }
  default             { say 'I don\'t see a Alfred' }
}

