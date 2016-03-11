#!/usr/bin/perl

use strict;
use warnings;

sub getnextpairset {
  my $counter = 0;
  my @pairlist = ([qw/LEAD bellri FRIEND noredo/],
               [qw/LEAD luin FRIEND manny/],
               [qw/LEAD klim FRIEND mick/],
               );
  sub {
    if($counter > $#pairlist){ return (); }
    return @{$pairlist[$counter++]};
  }
}

my $getpair = getnextpairset();

my @AoH;
while( my %fields = $getpair->()){
  push @AoH, { %fields };
}

# print the whole thing one at a time
for my $i ( 0 .. $#AoH ) {
  for my $role ( keys %{ $AoH[$i] } ) {
    print "elt $i $role is $AoH[$i]{$role}\n";
  }
}

#for my $i ( 0..$#AoH ){
#  print "$i is { ";
#  for my $role ( keys %{ $AoH[$i] } ){
#    print "$role=$AoH[$i]{$role} ";
#  }
#  print "}\n";
#}

#for my $href ( @AoH ){
#  print "{ ";
#  for my $role ( keys %{$href} ){
#    #print "$role=${$href}{$role} ";
#    print "$role=$href->{$role} ";
#  }
#  print "}\n";
#}

#use B::Deparse;
#my $bd = B::Deparse->new;
#print $bd->coderef2text($getpair);

#use Data::Dumper::Concise;
#print Data::Dumper::Concise::Dumper $getpair;

#use Data::Dumper;
#print Dumper \@AoH;

# Data::Dumper を使ってデータ構造を覗き見る
# http://www.omakase.org/perl/datadumper.html

