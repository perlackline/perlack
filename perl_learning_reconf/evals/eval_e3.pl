#!/usr/bin/perl

use strict;
use warnings;

# http://www.sthomas.net/roberts-perl-tutorial.htm/ch10/_ee
my $data='The function is <5funcA>';

our $funcA='*2+4';

print "$data\n";

no strict 'refs';
$data =~ s/<(\d)(\w+)>/($1+2).${$2}/;	# first time
#$data =~ s/<(\d)(\w+)>/($1+2).${$2}/e;	# second time
#$data =~ s/<(\d)(\w+)>/($1+2).${$2}/ee;	# third time

print "$data\n";

