#!/usr/bin/perl

use strict;
use warnings;

#my %provisions = (
#  'Bellri'  => [qw(bule_shirt hat jacket preserver sunscreen)],
#  'Aida'    => [qw(sunscreen water_bottle slide_rule radio)],
#  'Raraiya' => [qw(red_shirt hat lucky_socks water_bottle)],
#);

# @y と同じ index の要素が @y より大きい @x の要素を取得.
# index が @y より大きい要素は無条件で取得.

my @y = (qw(1 2 3));
my @x = (qw(1 10 8 9));

#my @bigger_indices = grep{
#  $_ > $#y or $x[$_] > $y[$_];
#} 0..$#x;
#my @bigger = @x[@bigger_indices];

my @bigger = grep{

  my $x_elm = $_;

  foreach my $y_elm (@y){
  $x_elm > $y_elm;
  #print "x: $x_elm\n";
  #print "y: $y_elm\n";
  }

} @x;

print "---\n";
print "$_\n" for @bigger;
