#!/usr/bin/perl

use strict;
use warnings;

my @arry = qw/1 2 3 4/;

print "\@arry: @arry\n";

my $num;
my @multipl = grep {
              $num = $_ * 3;
              $num % 2;
              } @arry;
#my @odd = grep { $_ % 2 } @arry;

print "\@arry    : @arry\n";
print "\@multipl : @multipl\n";

