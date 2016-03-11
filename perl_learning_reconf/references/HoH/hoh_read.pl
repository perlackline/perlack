#!/usr/bin/perl

use strict;
use warnings;

my %HoH;

while( <> ){
  next unless s/^(.*?):\s*//;
  my $who = $1;
  foreach my $field ( split ){
    my ($key,$value) = split /=/,$field;
    $HoH{$who}{$key} = $value;
  }

#  my $who = $1;
#  my $rec = {};
#  $HoH{$who} = $rec;
#  foreach my $field ( split ){
#    my ($key,$value) = split /=/, $field;
#    $rec->{$key} = $value;
#  }
}

use Data::Dumper;
print Dumper \%HoH;

