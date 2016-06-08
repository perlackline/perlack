#!/usr/bin/perl

use strict;
use warnings;

my %total_bytes;
while(<>){
  next if /^--/;
  my ($source,$destination,$bytes) = split;
  $total_bytes{$source}{$destination} += $bytes;
}

use YAML;
print Dump(\%total_bytes);
#print "------\n";
#print "------\n";
#use Data::Dumper;
#print Dumper(\%total_bytes);
