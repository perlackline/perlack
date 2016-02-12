#!/usr/bin/env perl

use strict;
use warnings;

my $papix = {
    name        => 'papix',
    affiliation => 'namba.pm',
    perl        => 60,
    python      => 50,
    ruby        => 50,
    php         => 80,
    binary      => 30,
};
my $boolfool = {
    name        => 'boolfool',
    affiliation => 'namba.pm',
    perl        => 40,
    python      => 10,
    ruby        => 20,
    php         => 30,
    binary      => 10,
};
my $moznion = {
    name        => 'moznion',
    affiliation => 'hachioji.pm',
    perl        => 100,
    python      => 70,
    ruby        => 80,
    php         => 50,
    binary      => 50,
};
my $binarian = {
    name        => 'binarian',
    affiliation => 'hachioji.pm',
    perl        => 10,
    python      => 11,
    ruby        => 1,
    php         => 100,
    binary      => 100,
};
my $uzulla = {
    name        => 'uzulla',
    affiliation => 'hachioji.pm',
    perl        => 1,
    python      => 0.01,
    ruby        => 0.5,
    php         => 4,
    binary      => 0.01,
};

use Data::Dumper;

my @ary = ($papix, $boolfool, $moznion, $binarian, $uzulla);
my @lang = qw(perl python ruby php binary);

foreach my $ary_ref (@ary) {

  foreach my $lang (@lang) {
    $ary_ref->{sum} += $ary_ref->{$lang};
  } 

  # humm..
  print map{ "$_ => $ary_ref{$_}" } (keys %$ary_ref); 

  # OK
  #print Dumper($ary_ref), "\n";

}

