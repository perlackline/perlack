#!/usr/bin/perl

use strict;
use warnings;

my %TV = ( 
  flintstones => {
    series  => "flintstones",
    nights  => [ qw(monday thursday friday) ],
    members => [
      { name => "fred",    role => "lead", age => 36, },
      { name => "wilma",   role => "wife", age => 31, },
      { name => "pebbles", role => "kid",  age => 4, },
    ],  
  },  
  jetsons => {
    series  => "jetsons",
    nights  => [ qw(wednesday saturday) ],
    members => [
      { name => "george", role => "lead", age => 41, },
      { name => "jane",   role => "wife", age => 39, },
      { name => "elroy",  role => "kid",  age => 9, },
    ],  
  },  
  simpsons => {
    series  => "simpsons",
    nights  => [ qw(monday) ],
    members => [
      { name => "homer", role => "lead", age => 34, },
      { name => "marge", role => "wife", age => 37, },
      { name => "bart",  role => "kid",  age => 11, },
    ],  
  },  
);

# ポインターの作成
foreach my $family (keys %TV) {
  my $rec = $TV{$family}; # temp pointer
  my @kids = ();
  for my $person ( @{ $rec->{members} } ) {
    if ($person->{role} =~ /kid|son|daughter/) {
      push @kids, $person;
    }
  }
  # REMEMBER: $rec and $TV{$family} point to same data!!
  $rec->{kids} = [ @kids ];
}

# ポインターを利用してデータを更新
$TV{simpsons}{kids}[0]{age}++;
$TV{jetsons}{kids}[0]{age}++;
$TV{flintstones}{kids}[0]{age}++;

print "$TV{simpsons}{members}[2]{age}\n";
print "$TV{jetsons}{members}[2]{age}\n";
print "$TV{flintstones}{members}[2]{age}\n";



