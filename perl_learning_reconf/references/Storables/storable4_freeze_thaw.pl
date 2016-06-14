#!/usr/bin/perl

use strict;
use warnings;

my %table = (
 
  # ハッシュ
  flintstones => {
    # スカラ
    series  => "flintstones",
    # 配列
    nights  => [ qw(monday thursday friday) ],
    # ハッシュの配列
    members => [
      { name => "fred",    role => "lead", age => 36, },
      { name => "wilma",   role => "wife", age => 31, },
      { name => "pebbles", role => "kid",  age => 4, },
      { name => "anon boy",  role => "son",  age => 99, },
    ],
  },
  jetsons => {
    series  => "jetsons",
    nights  => [ qw(wednesday saturday) ],
    members => [
      { name => "george", role => "lead", age => 41, },
      { name => "jane",   role => "wife", age => 39, },
      { name => "elroy",  role => "kid",  age => 9, },
      { name => "anon girl",  role => "daughter",  age => 99, },
    ],
  },
  simpsons => {
    series  => "simpsons",
    nights  => [ qw(monday) ],
    members => [
      { name => "homer", role => "lead", age => 34, },
      { name => "marge", role => "wife", age => 37, },
      { name => "bart",  role => "kid",  age => 11, },
      { name => "anon girl",  role => "daughter",  age => 99, },
    ],
  },
);

use Storable qw/freeze nfreeze thaw/;

my $serialized = freeze \%table;
my $table_clone = thaw $serialized;

print "$table_clone\n";
use Data::Dumper;
#print Dumper $table_clone;

#foreach my $key (keys %{$table_clone}){
#  print "key: $key\n";
#}


