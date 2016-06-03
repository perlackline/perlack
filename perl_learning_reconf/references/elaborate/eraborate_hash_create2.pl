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

#my $rec;
#foreach my $family (keys %TV){
#  $rec = $TV{$family}; # temp pointer
#  my @kids = ();
#  foreach my $person ( @{$rec->{members}} ){
#    if ($person->{role} =~ /kid|son|daughter/){
#      push @kids, $person;
#    }
#  }
#  # REMEMBER: $rec and $TV{$family} point to same data!!
#  $rec->{kids} = [ @kids ];
#}
#
#$TV{simpsons}{kids}[0]{age}++;
#print $TV{simpsons}{members}[2]{age}; 

# 全体を表示する
foreach my $family (keys %TV){
  print "the $family";
  print " is on during @{$TV{$family}{nights}}\n";
  print "its members are:\n";
  foreach my $who (@{$TV{$family}{members}}){
    print " $who->{name} ($who->{role}), age $who->{age}\n";
  }
  print "it turns out that $TV{$family}{role} has ";
  print scalar (@{$TV{family}{kids}}), " kids named ";
print "---\n";
  print join(",",map{ $_->{name}} @{$TV{$family}{kids}});
  print "\n";
}

#use Data::Dumper;
use DDP;
#p %TV;
#print Dumper \%TV;
