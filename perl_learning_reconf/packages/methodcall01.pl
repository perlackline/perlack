#!/usr/bin/perl

use strict;
use warnings;

sub Cow::speak{
  print "a Cow goes moooo!\n";
}
sub Horse::speak{
  print "a Horse goes neigh!\n";
}
sub Sheep::speak{
  print "a Sheep goes baaaah!\n";
}

no strict 'refs';
my @pasture = qw(Cow Cow Horse Sheep Sheep);
foreach my $beast (@pasture){
  &{$beast."::speak"};
}

