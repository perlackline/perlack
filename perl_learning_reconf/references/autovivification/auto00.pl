#!/usr/bin/perl

use strict;
use warnings;

my %provisions;
my $person;

while(<>){
  if(/^(\S.*)/){  # 搭乗者の名前 (インデントなし)
    $person = $1;
    $provisions{$person} = [] unless exists $provisions{$person};
  }elsif(/^\s+(\S.*)/){  # 持ち物
    die 'No person yet!' unless defined $person;
    push @{$provisions{$person}}, $1;
  }else{
    die "I don't understand: $_";
  }
}

foreach my $key (keys %provisions){
  print "$key\n";
  print "@{$provisions{$key}}\n";
}

#use Data::Dumper;
#print Dumper %provisions;

