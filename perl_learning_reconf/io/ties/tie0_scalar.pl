#!/usr/bin/perl

use strict;
use warnings;

use Tie::Scalar::Timeout;

# the timeout will be between 0 and 29 
my $random_timeout = rand 30;
tie my $k, 'Tie::Scalar::Timeout', VALUE => 1, EXPIRES => "+20s";
#tie my $k, 'Tie::Scalar::Timeout', VALUE => 1, EXPIRES => "+${random_timeout}s";
sleep(15);
print 'The timeout ', ($k) ? 'did not happen' : 'happened', "\n";

