#!/usr/bin/perl

use strict;
use warnings;

sub find_days {
  qw/Sunday Friday Saturday/;
  #qw/Sunday Monday Tuesday Wednesday Thursday Friday Saturday/;
}

use Data::Dumper;

# フィールド毎に構築
my $rec = {};
$rec->{series} = "flintstones";
$rec->{nights} = [ find_days() ];

my @members = ();
while(<>){
  my %fields = split /[\s=]+/;
  push @members, { %fields };
}
$rec->{members} = [ @members ];

# now remember the whole thing
my %TV;
$TV{ $rec->{series} } = $rec;

my $d = Data::Dumper->new([$TV{$rec->{series}}],['*TV']);
print $d->Dump;

