#!/usr/bin/perl

use strict;
use warnings;

my $result = `./prompt.pl < /dev/null`;
#my $result = `date < /dev/null`;

print "$result\n";


