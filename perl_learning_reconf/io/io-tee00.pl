#!/usr/bin/perl

use strict;
use warnings;

#use IO::Tee;

my $string = '';

open my $log_fh, '>>', 'text.in' or die "$!";
open my $scalar_fh, '>>', \$string;

my $log_message = "The Minnow is taking on water!\n";

print $log_fh $log_message;
print $scalar_fh $log_message;

print "scalar: $string\n";

