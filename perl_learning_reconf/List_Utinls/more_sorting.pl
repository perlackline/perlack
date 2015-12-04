#!/usr/bin/perl

use strict;
use warnings;

use List::MoreUtils ':all';

#my @people = qw(abc111de 100 211 99);

#my @people = (
#    {p_name => 'Alfred',    f_name => 'Izuruha',   age => 11},
#    {p_name => 'Chay',      f_name => 'friends',   age => 11},
#    {p_name => 'Chaelie',   f_name => 'friends',   age => 11},
#    {p_name => 'Telcott',   f_name => 'friends',   age => 11},
#    {p_name => 'Bernard',   f_name => 'Wiseman',   age => 19},
#    {p_name => 'Christine', f_name => 'Macknezie', age => 21},
#             );

#my @nums = qw(4 the3rd the1 2nd);

my @nums = qw(99 98 101 100 );

my @x = nsort_by { $_ } @nums;
#my @x = sort_by { $_->{p_name} } @people;
#my @x = sort { $a->{p_name} cmp $b->{p_name} } @people;
#sort_by { $_ } @people;
#my @x = sort_by { s/(\d+)/sprintf "number: %04d",$1/eg; $_ } @nums;
#my @x = sort_by { s/^(\D+)?(\d+)(\D+)?$/sprintf "%04d",$2/eg; $_ } @nums;
#my @x = sort_by { s/(\d+)/sprintf "Do ? %05d",$1/eg; $_ } @people;
#my @x = sort_by { s/(\d+)/sprintf "Do ? %05d",$1/eg; $_ } @people;
#my @x = nsort_by { $_ } @people;
#my $x = sort_by { $_ } @people;

print "@x\n";
#print "elm: $_\n" for @people;
#map{ print "people: ", $_->{p_name}, "\n"; }@people;
#print "$_\n"for @x;
#print "\@x : @x\n";
#print "\$x : $x\n";

