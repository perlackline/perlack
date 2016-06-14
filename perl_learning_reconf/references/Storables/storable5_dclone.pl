#!/usr/bin/perl

use strict;
use warnings;

my %hash = (key1=>'val1', key2=>'val2');
my $hash_ref = \%hash;

my @array = ( 'elm0', $hash_ref, 'elm2');

print map{ "$_\n" } @array;

use Storable qw/dclone/;

my $clone = dclone( \@array );
#my $clone = \@array;

print map{ "$_\n" } @{$clone};

print "---\n";
foreach my $key (keys %{$clone->[1]}){
  print "$key\n";
}

