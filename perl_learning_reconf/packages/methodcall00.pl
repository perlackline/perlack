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

Cow::speak;
Horse::speak;
Sheep::speak;

