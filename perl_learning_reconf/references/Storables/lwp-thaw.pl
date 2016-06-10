#!/usr/bin/perl

use strict;
use warnings;

use Storable qw(thaw);
use LWP::Simple;
use Data::Dumper;

my $uri = shift;
my $frozen = get($uri);
my $obj = thaw $frozen;
print Dumper $obj;

