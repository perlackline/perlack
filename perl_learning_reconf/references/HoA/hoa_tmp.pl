#!/usr/bin/perl

use strict;
use warnings;

my %HoA;

while(my $line = <>){
  #chomp $line;
  next if $line =~ /\A\n\z/;
  my ($who, $rest) = split /:\s*/, $line, 2;
  my @fields = split ' ', $rest;
  $HoA{$who} = [ @fields ];
}

use Data::Dumper;
print Dumper \%HoA;


#foreach my $key ( keys %HoA ){
#  print "$key:\n";
#  foreach my $elm ( @{$HoA{$key}} ){
#    print "\t$elm\n";
#  }
#}


