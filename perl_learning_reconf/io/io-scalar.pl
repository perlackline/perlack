#!/usr/bin/perl

use strict;
use warnings;

#use IO::Scalar;

my $string_log = '';
open my $scalar_fh , '>', \$string_log or die;
print $scalar_fh "The Howells' private beach club is closed\n";

print "$string_log";
