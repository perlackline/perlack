#!/usr/bin/perl

use strict;
use warnings;

my %hash = ( Al => '00', Bernie => '01', Chris => '02' );

print "$_ : $hash{$_}\n" for ( keys %hash );

#my @arry = ($hash{Al}, $hash{Bernie}, $hash{Chris});
my @arry = @hash{ 'Al', 'Bernie', 'Chris' };

print %hash, "\n";
#print "arry: $_\n" for @arry;

