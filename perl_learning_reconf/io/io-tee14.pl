#!/usr/bin/perl

use strict;
use warnings;

use IO::Tee;

my $tee = IO::Tee->new(">text.out1", ">> text.out2");
#my $tee = IO::Tee->new(">text.out1", "text.out, 'w'");

print $tee "hello!!!\n";

print "$_\n" for $tee->handles;
