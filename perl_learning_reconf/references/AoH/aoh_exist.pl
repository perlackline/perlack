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

${$AoH[0]}{SISTER} = "aida";
$AoH[0]->{CAPTAIN} = "donyell";

#use B::Deparse;
#my $bd = B::Deparse->new;
#print $bd->coderef2text($getpair);

#use Data::Dumper::Concise;
#print Data::Dumper::Concise::Dumper $getpair;

use Data::Dumper;
print Dumper \@AoH;

# Data::Dumper を使ってデータ構造を覗き見る
# http://www.omakase.org/perl/datadumper.html

