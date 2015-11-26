#!/usr/bin/perl

use strict;
use warnings;

use Benchmark qw/timethese cmpthese/;
use List::Util ();

my $max = shift || 1000;
my $count = shift || 0;
my @shuffled = List::Util::shuffle(1..$max);

sub max_vanilla {
  my $m = shift;
  $m < $_ and $m = $_ for @_;
  $m;
}

sub sort_and_max {
  (sort{ $b <=> $a } @_)[0];
}

cmpthese( timethese( $count, {
  'Vanilla'    => sub { max_vanilla(@shuffled)     == $max or die },
  'List::Util' => sub { List::Util::max(@shuffled) == $max or die },
  'Sort+Head'  => sub { sort_and_max(@shuffled)    == $max or die },
}));

sub minstr_vanilla {
  my $m = shift;
  $m gt $_ and $m = $_ for @_;
  $m;
}

sub sort_and_minstr {
  (sort @_)[0];
}

cmpthese( timethese( $count, {
  'Vanilla'    => sub { minstr_vanilla(@shuffled)     eq '1' or die },
  'List::Util' => sub { List::Util::minstr(@shuffled) eq '1' or die },
  'Sort+Head'  => sub { sort_and_minstr(@shuffled)    eq '1' or die },
}));

