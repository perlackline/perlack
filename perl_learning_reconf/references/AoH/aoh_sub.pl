#!/usr/bin/perl

use strict;
use warnings;

my $counter = 0;
my @pairset = ([qw/LEAD bellri FRIEND noredo/],
               [qw/LEAD luin FRIEND manny/],
               [qw/LEAD klim FRIEND mick/],
               );

sub getnextpairset {
    if($counter > $#pairset){ return (); }
    return @{$pairset[$counter++]};
}

my @AoH;
#getnextpairset();
#push @AoH, getnextpairset();

while( my %fields = getnextpairset()){
#while( 1 ){
  push @AoH, { %fields };
  #push @AoH, { getnextpairset() } ;
}

use Data::Dumper;
print Dumper \@AoH;


