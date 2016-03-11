#!/usr/bin/perl

use strict;
use warnings;

sub get_family {
  my $group = shift;

  if( $group eq 'flintstones' ){
    #qw/fred barney wilma dino/;
    qw/fred /;
  }elsif( $group eq 'jetsons' ){
	#qw/george jane judy elroy/;
    qw/george jane /;
  }elsif( $group eq 'simpsons' ){
    qw/homer marge bart lisa maggie/;
  }
}

my %HoA;

foreach my $group ( qw/flintstones jetsons simpsons/ ){
  $HoA{$group} = [ get_family($group) ];
}

foreach my $family ( sort{ @{$HoA{$b}} <=> @{$HoA{$a}} } keys %HoA ){
  print "$family: @{$HoA{$family}}\n";
}


#use Data::Dumper;
#print Dumper \%HoA;

