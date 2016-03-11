#!/usr/bin/perl

use strict;
use warnings;

my %HoA;

while(<>){
  #next unless s/^(.*?):\s*//;
  next unless /^(.*?):\s*/;
  $HoA{$1} = [ split ];
}

use Data::Dumper;
print Dumper \%HoA;


#foreach my $key ( keys %HoA ){
#  print "$key:\n";
#  foreach my $elm ( @{$HoA{$key}} ){
#    print "\t$elm\n";
#  }
#}


