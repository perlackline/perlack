#!/usr/bin/perl

use strict;
use warnings;

use List::MoreUtils ':all';
#use List::MoreUtils ':all'; $a || $b || 1;

#my @list =  1..3;
#my @list = qw/This is a list/; 

my @a = qw(a a b c c);
my @b = qw(1 1 2 3 3);

my @x = singleton @a, @b;
#my @x = uniq undef, 'a', 'a', 'b';
#my $x = uniq @a, @b;
#my @x = zip @a, @b, @c;
#my @x = mesh @a, @b, @c;
#my @x = pairwise { our $a + our $b } @a, @b;
#my @x = pairwise { our($a, $b); $a + $b } @a, @b;

#my @result = apply { $_ *= 2 } @list;
#insert_after { s/^T[his]+/That/ } "longer", @list;
#insert_after_string "This" => "value" => @list;

print "a  : @a\n";
print "b  : @b\n";
print "x  : @x\n";
#print "x  : $x\n";
#print "result: @result\n";
#print "list  : @list\n";

#if (defined $result) {
#map { print "\@empty: $_\n" } $result;
#}else{
# print "undef!\n";
#}

