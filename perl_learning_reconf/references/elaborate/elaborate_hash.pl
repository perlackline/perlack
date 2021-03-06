#!/usr/bin/perl

use strict;
use warnings;

my %TV = (
  flintstones => {
    series  => "flintstones",
    nights  => [ qw(monday thursday friday) ],
    members => [
      { name => "fred",    role => "lead", age => 36, },
      { name => "wilma",   role => "wife", age => 31, },
      { name => "pebbles", role => "kid",  age => 4, },
    ],
  },
  jetsons => {
    series  => "jetsons",
    nights  => [ qw(wednesday saturday) ],
    members => [
      { name => "george", role => "lead", age => 41, },
      { name => "jane",   role => "wife", age => 39, },
      { name => "elroy",  role => "kid",  age => 9, },
    ],
  },
  simpsons => {
    series  => "simpsons",
    nights  => [ qw(monday) ],
    members => [
      { name => "homer", role => "lead", age => 34, },
      { name => "marge", role => "wife", age => 37, },
      { name => "bart",  role => "kid",  age => 11, },
    ],
  },
);

use Data::Dumper;
open my $fh, '>', 'data00' or die "$!";
print $fh Dumper \%TV;
close $fh;

#use DDP;
#p %TV;

# nama, role, age (array of hash)
#foreach my $family (keys %TV){
#  foreach my $h_ref (@{ $TV{$family}{members} }){
#    map { print "$_: $h_ref->{$_}, " } keys %{ $h_ref };
#    print "\n";
#    #map { print "$_: $TV{$family}{members}{$hash}{$_}" } keys %{ $TV{$family}{members}{$hash} };
#  }
#  print "--- ---\n";
#}

# day of the week (array)
#foreach my $family (keys %TV){
##  print "$TV{$family}{series}\n";
#  print "nights: ";
#  map { print "$_ " } @{ $TV{$family}{nights} };
#  print "\n";
##  print "\n--- ---\n";
#}

# family name (scalar)
#foreach my $family (keys %TV){
#  print "series: $TV{$family}{series}\n";
#}

#for my $family ( keys %TV){
#  print "series: $TV{$family}{series}\n";
#
#  for my $nights ( @{$TV{$family}{nights}} ){
#    print "  nights: $nights";
#  }
#  print "\n";
#
#  for my $h_ref ( @{ $TV{$family}{members} } ){
#    map { print "  $_ => $h_ref->{$_}," } keys %{ $h_ref };
#    print "\n";
#  }  
##  for my $i ( 0..$#{$TV{$family}{members}} ){
##    for my $key (keys %{$TV{$family}{members}[$i]}){
##      print "  $key => $TV{$family}{members}[$i]{$key}";
##    }
##    print "\n";
##  }
#  print "--- --- ---\n";
#}
#
