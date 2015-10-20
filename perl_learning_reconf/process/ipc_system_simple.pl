#!/usr/bin/perl

use strict;
use warnings;

use IPC::System::Simple qw(system systemx capture capturex);


my $result_cap  = capturex 'echo', 'Hello';
print "$result_cap";

#my $result_back =  `echoo Hello`;
#print "$result_back";


# my @arg = 'Hello';
# my @arg = 'Hello | ls';
# systemx 'echo', @arg;
# system "echo @arg";


