#!/usr/bin/perl

use strict;
use warnings;

my %provisions = (
  'Bellri'  => [qw(bule_shirt hat jacket preserver sunscreen)],
  'Aida'    => [qw(sunscreen water_bottle slide_rule radio)],
  'Raraiya' => [qw(red_shirt hat lucky_socks water_bottle)],
);

my $numbers = [ qw(1 2 4 8 16 32 64) ];

my @indices_of_odd_digit_sums = grep{
  my $number = $$numbers[$_];
  my $sum;
  $sum += $_ for split //, $number;
  $sum % 2;
} 0.. $#$numbers;

foreach my $elm (@indices_of_odd_digit_sums){
  print "$elm\n";
}

print "---\n";
my @odd_digit_sums = @{$numbers}[ @indices_of_odd_digit_sums ];

foreach my $elm (@odd_digit_sums){
  print "$elm\n";
}

