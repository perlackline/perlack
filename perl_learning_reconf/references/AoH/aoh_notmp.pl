#!/usr/bin/perl

use strict;
use warnings;

# closure
sub getnextpairset {
  my $counter = 0;
  my @pairlist = ([qw/LEAD bellri FRIEND noredo/],
               [qw/LEAD luin FRIEND manny/],
               [qw/LEAD klim FRIEND mick/],
               );
  # return coderef
  sub {
    if($counter > $#pairlist){ return 0; }
    return @{$pairlist[$counter++]};
  }
}

# get coderef
my $getpair = getnextpairset();

my @AoH;
push @AoH, { $getpair->() };
push @AoH, { $getpair->() };
push @AoH, { $getpair->() };
#while ( push @AoH, {$getpair->()} ){
#  ;
#}

#use B::Deparse;
#my $bd = B::Deparse->new;
#print $bd->coderef2text($getpair);

#use Data::Dumper::Concise;
#print Data::Dumper::Concise::Dumper $getpair;

use Data::Dumper;
print Dumper \@AoH;

# Data::Dumper を使ってデータ構造を覗き見る
# http://www.omakase.org/perl/datadumper.html

