#!/usr/bin/perl

use strict;
use warnings;

# Effective Perl P82 Schwartz Transform

my @names = glob('*');
my @names_and_ages = map{ [$_, -M] } @names;
#my @names_and_ages = map{ [$_, -s] } @names;

#print map{ 
#  my($file,$m) = @{$_};
#  "$file\n$m\n---\n"; 
#} @names_and_ages;

my @sorted_names_and_ages =
  sort { $a->[1] <=> $b->[1] } @names_and_ages;

#print "$_->[0] : $_->[1]\n" for @sorted_names_and_ages;

my @sorted_names =
  map { $_->[0] } @sorted_names_and_ages;

print "$_\n" for @sorted_names;

