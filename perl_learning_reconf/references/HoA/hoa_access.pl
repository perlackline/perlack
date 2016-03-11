#!/usr/bin/perl

use strict;
use warnings;

sub get_family {
  my $group = shift;

  if( $group eq 'flintstones' ){
    qw/fred barney wilma dino/;
    #qw/fred /;
  }elsif( $group eq 'jetsons' ){
	qw/george jane judy elroy/;
    #qw/george jane /;
  }elsif( $group eq 'simpsons' ){
    qw/homer marge bart lisa maggie/;
  }
}

my %HoA;

foreach my $group (qw/simpsons jetsons flintstones/){
  my @members = get_family($group);
  $HoA{$group} = [ @members ];
}

# print the whole thing sorted by number of memgers
#foreach my $family ( sort { @{$HoA{$b}} <=> @{$HoA{$a}} } keys %HoA ){
#  print "$family: @{ $HoA{$family} }\n";
#  }

#foreach my $family ( keys %HoA ) {
#     print "$family: @{ $HoA{$family} }\n"
# }
#
#foreach my $family ( keys %HoA ) {
#     print "family: ";
#     foreach my $i ( 0 .. $#{ $HoA{$family} } ) {
#         print " $i = $HoA{$family}[$i]";
#         #print "$HoA{$family}[$i]";
#     }
#     print "\n";
#}
#
foreach my $family (
  sort{ @{$HoA{$b}}<=>@{$HoA{$a}}
    ||
  $a cmp $b } keys %HoA){
  print "$family: ", join(", ", sort @{ $HoA{$family} }), "\n";
}

#use Data::Dumper;
#print Dumper \%HoA;

