#!/usr/bin/perl

use strict;
use warnings;

use List::MoreUtils ':all';

my @list = qw( 1 );
#my @list = ();

#my @result = all { $_ >= 0 } @list;
#my $result = all_u { $_ >= 0 } @list;
#my @result = any { $_ >= 0 } @list;
#my @result = none { $_ >= 0 } @list;
#my @result = notall { $_ >= 0 } @list;
#my @result = one { $_ == 0 } @list;
my @result = one { defined($_) } @list;

map { print "\@resutl: $_\n" } @result;

#if (defined $result) {
#map { print "\@empty: $_\n" } $result;
#}else{
# print "undef!\n";
#}

