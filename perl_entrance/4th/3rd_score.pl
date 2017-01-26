#!/usr/bin/perl

use strict;
use warnings;
#binmode STDOUT, ":utf8";

# 無名ハッシュリファンレス
my $alice = {
  name => 'Alice',
  country => 'England',
  perl => 60,
  python => 80,
  ruby => 80,
  php => 50,
  binary => 30,
};
my $bob= {
  name => 'bob',
  country => 'America',
  perl => 40,
  python => 10,
  ruby => 20,
  php => 30,
  binary => 50,
};
my $carol= {
  name => 'Carol',
  country => 'England',
  perl => 100,
  python => 70,
  ruby => 80,
  php => 50,
  binary => 50,
};
my $dave= {
  name => 'Dave',
  country => 'Canada',
  perl => 60,
  python => 11,
  ruby => 1,
  php => 100,
  binary => 100,
};
my $ellen = {
  name => 'Ellen',
  country => 'America',
  perl => 1,
  python => 15,
  ruby => 0.5,
  php => 60,
  binary => 0.01,
};

my @people = ($alice, $bob, $carol, $dave, $ellen);
my @languages = qw/perl python ruby php binary/;

print "--- sum\n";

foreach my $people (@people){
    my $score;
    my $name = $people->{name};
    foreach my $lang (@languages){
      $score += $people->{$lang};
    }
    $people->{sum} = $score;
}

use Data::Dumper;
print Dumper($_) for @people;

print "--- average\n";

my $average = {};
foreach my $people (@people){
  my $score;
  my $name = $people->{name};
  foreach my $lang (qw/perl ruby python/){
    $score += $people->{$lang};
  }
  $average->{$name} = $score / 3;
}

print Dumper($average);

print "--- evalution\n";

foreach my $people (@people){
  my $stars;
  print $people->{name}, "\n";
  foreach my $lang (@languages){
    my $star = "★";
    my $score = $people->{$lang};
    $stars = $star x 5 if $score == 100;
    $stars = $star x 4 if $score <= 99 && $score >= 80;
    $stars = $star x 3 if $score <= 79 && $score >= 60;
    $stars = $star x 2 if $score <= 59 && $score >= 40;
    $stars = $star     if $score <= 39 && $score >= 20;
    $stars = ''        if $score <= 19;

    print "  perl   : $stars ($score)\n" if $lang eq 'perl';
    print "  python : $stars ($score)\n" if $lang eq 'python';
    print "  ruby   : $stars ($score)\n" if $lang eq 'ruby';
    print "  php    : $stars ($score)\n" if $lang eq 'php';
    print "  binary : $stars ($score)\n" if $lang eq 'binary';
  }
}

print "--- highscore\n";

my $highscore = {};
foreach my $people (@people){
  if ($people->{perl} >= 60){
    push @{$highscore->{$people->{country}}}, $people->{name}; 
  }
}

foreach my $country (keys %{$highscore}){
  print "$country : ";
  print "$_ " for @{$highscore->{$country}};
  print "\n";
}

print "--- JSON like\n";

print "[\n";
foreach my $people (@people){
  print "  {\n";
  foreach my $key (keys %{$people}){
    if ($key eq 'country' or $key eq 'name'){
      print qq/\t"$key" : "$people->{$key}"/;  
    }else{
      print qq/\t"$key" : $people->{$key}/;  
    }
    print "\n";
  }
  print "  }\n";
}

print "]\n";
