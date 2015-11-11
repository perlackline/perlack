#!/usr/bin/perl

use strict;
use warnings;

use 5.010;

sub my_hup_handler  { state $n; say 'Caught HUP: ',  ++$n }
sub my_usr1_handler { state $n; say 'Caught USR1: ', ++$n }
sub my_usr2_handler { state $n; say 'Caught USR2: ', ++$n }
sub my_int_handler  { say 'Caught INT. Exiting.'; exit }

say "I am $$";

foreach my $signal ( qw(int hup usr1 usr2)) {
  $SIG{ uc $signal } = "my_${signal}_handler";
}

while (1) { sleep 1 };




