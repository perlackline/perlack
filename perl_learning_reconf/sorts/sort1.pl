#!/usr/bin/perl

use strict;
use warnings;
use utf8;

print by_number0(1,2), "\n";;
print by_number0(2,1), "\n";;
print by_number0(2,2), "\n";;

sub by_number0 {
  my $a1 = shift;
  my $b1 = shift;
if ($a1 < $b1) { -1 } elsif ($a1 > $b1) { 1 } else { 0 }
}

my @numbers = qw/ 111 98 99 100 101  /;
my @result1 = sort @numbers;
print "@result1\n";
my @result2 = sort by_number(@numbers);
print "@result2\n";

my @result3 = sort { $a <=> $b } @numbers;
print "@result3\n";


sub by_number {
if ($a < $b) { -1 } elsif ($a > $b) { 1 } else { 0 }
}

