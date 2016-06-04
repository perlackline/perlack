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

die "please file for arg\n" unless @ARGV;

my @members = ();
while (<>) {
  my %fields = split /[\s=]+/;
  push @members, { %fields };
}
$rec->{members} = [ @members ];

my %TV;
$TV{ $rec->{series} } = $rec;
foreach my $key (keys $TV{ $rec->{series} });
  ...

#print Dumper $rec;


