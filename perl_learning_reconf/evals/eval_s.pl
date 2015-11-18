#!/usr/bin/perl

use strict;
use warnings;

my $exp = '5 + 8'; 

$exp =~ s/(\d+\s?[-+\/*]\s?\d)/$1/e;

print $exp, "\n";

#our $var = 'TESTING';
#my $str = 'In this string we are $var the "e" modifier.';
#
#no strict 'refs';
#$str =~ s/\$(\w+)/$$1/e;
#
#print $str, "\n"; 
