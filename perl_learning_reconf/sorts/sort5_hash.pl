#!/usr/bin/perl

use strict;
use warnings;

my %score = (
        barney => 195,
        fred   => 205,
        dino   => 30,
);

my @winners = sort by_score  keys %score;


print "$winners[0]\n";

sub by_score { $score{$b} <=> $score{$a} }
