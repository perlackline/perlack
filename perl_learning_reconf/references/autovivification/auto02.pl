#!/usr/bin/perl

use strict;
use warnings;

my $total;
#while(<>){
#  next if /^--/;
#  my($src,$bytes) = split;
#  $total->{$src} += $bytes;
#}
#map { print "$_ : $total->{$_}\n" } sort keys %{$total};
while(<>){
  next if /^--/;
  my ($src,$dst,$bytes) = split;
  $total->{$src}->{$dst} += $bytes;
}

foreach my $src (sort keys %{$total}){
  foreach my $dst (sort keys %{$total->{$src}}){
    print "$src to $dst : ",
      "$total->{$src}->{$dst} bytes\n";
  }
  print "\n";
}

print "--- dump \%total ---\n";
use Data::Dumper;
print Dumper $total;
#print Dumper %total;

