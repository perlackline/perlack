#!/usr/bin/perl

use strict;
use warnings;

sub get_family {
  my $group = shift;

  if( $group eq 'flintstones' ){
    qw/fred barney wilma dino/;
  }elsif( $group eq 'jetsons' ){
    qw/george jane judy elroy/;
  }elsif( $group eq 'simpsons' ){
    qw/homer marge bart lisa maggie/;
  }
}

my %HoA;

foreach my $group (qw/simpsons jetsons flintstones/){
  my @members = get_family($group);
  $HoA{$group} = [ @members ];

}

use Data::Dumper;
print Dumper \%HoA;


#foreach my $key ( keys %HoA ){
#  print "$key:\n";
#  foreach my $elm ( @{$HoA{$key}} ){
#    print "\t$elm\n";
#  }
#}


