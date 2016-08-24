#!/usr/bin/perl

use strict;
use warnings;

use IO::Tee;

my $string = '';

open my $log_fh, '>>', 'text.in' or die "$!";
open my $scalar_fh, '>>', \$string;

my $tee_fh = IO::Tee->new( $log_fh, $scalar_fh );

print $tee_fh "The radio works in the middle of the ocean!\n";

print "scalar: $string\n";

