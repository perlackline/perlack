#!/usr/bin/perl

use strict;
use warnings;

sub get_family {
  my $group = shift;
  if( $group eq 'Zenam' ){
    qw/Son Bellri Mother Wilmit/;
  }elsif( $group eq 'Surugan' ){
    qw/Daughter Aida Father Gusion/;
  }
}

my %HoH;
foreach my $group ( "Zenam", "Surugan" ){
  $HoH{$group} = { get_family($group) };
}
# ---
my %new_folks = (
  Friend => 'Nored',
  Instructor => 'Dellensen',
);

foreach my $what (keys %new_folks){
  $HoH{Zenam}{$what} = $new_folks{$what};
}
# ---

my %rank;
my $i = 0;
foreach (qw(Son Daughter Father Mother Friend Instructor)){
  $rank{$_} = ++$i }

foreach my $family (sort{keys %{$HoH{$b}} <=> keys %{$HoH{$a}}} keys %HoH){
  print "$family: { ";
  foreach my $role (
    sort{$rank{$a} <=> $rank{$b}} keys %{$HoH{$family}})
  {
    print "$role=$HoH{$family}{$role} ";
  }
  print "}\n";
}

#print ${$HoH{Zenam}}{Son}, "\n";
#print $HoH{Zenam}->{Son}, "\n";
#print $HoH{Zenam}{Son}, "\n";


#use Data::Dumper;
#print Dumper \%HoH;

# Data::Dumper を使ってデータ構造を覗き見る
# http://www.omakase.org/perl/datadumper.html

