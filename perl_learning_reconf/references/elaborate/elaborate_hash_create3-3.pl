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
      { name => "anon boy",  role => "son",  age => 99, },
    ],  
  },  
  jetsons => {
    series  => "jetsons",
    nights  => [ qw(wednesday saturday) ],
    members => [
      { name => "george", role => "lead", age => 41, },
      { name => "jane",   role => "wife", age => 39, },
      { name => "elroy",  role => "kid",  age => 9, },
      { name => "anon girl",  role => "daughter",  age => 99, },
    ],  
  },  
  simpsons => {
    series  => "simpsons",
    nights  => [ qw(monday) ],
    members => [
      { name => "homer", role => "lead", age => 34, },
      { name => "marge", role => "wife", age => 37, },
      { name => "bart",  role => "kid",  age => 11, },
      { name => "test",  role => "daughter",  age => 99, },
      { name => "anon girl",  role => "daughter",  age => 99, },
    ],  
  },  
);

# ---------------------------------
# make pointers to kids
foreach my $family ( keys %TV ) {
  my $rec = $TV{$family};
  my @kids = ();
  foreach my $person ( @{$rec->{members}} ){
    if ( $person->{role} =~ /kid|son|daughter/ ){
      push @kids, $person;
    }
  }
  $rec->{kids} = [ @kids ];
}
# ---------------------------------
# make pointers to lead
# ---------------------------------
foreach my $family ( keys %TV ) {
  my $rec = $TV{$family};
  my @leads = ();
  foreach my $person ( @{$rec->{members}} ){
    $rec->{leads} = $person->{name} if ( $person->{role} =~ /lead/ )
  }
}

# print the whole thing
foreach my $family (keys %TV){

  # family name
  print "the $family";

  # night list
  print " is on during @{ $TV{$family}{nights} }\n";

  # personal name and data
  print "its membets are:\n";
  foreach my $who ( @{$TV{$family}{members}}){
    print " $who->{name} ($who->{role}), age $who->{age}\n";
  }

  # family lead
  print "it turns out that $TV{$family}{leads} has ";
  #print "it turns out that $TV{$family}{members}[0]{name} has ";

  # kids
  print scalar ( @{ $TV{$family}{kids} } ), " kids named ";
  print join ( ", ", map{ $_->{name} } @{$TV{$family}{kids}} );
  print "\n---\n";
}

