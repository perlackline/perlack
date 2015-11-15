#!/usr/bin/perl

use strict;
use warnings;

my %hash = ( Al => '00', Bernie => '01', Chris => '02' );

@hash{ qw/Al Chris/ } = qw/ 000 002 /;

print "$_: $hash{$_}\n" for keys %hash;

