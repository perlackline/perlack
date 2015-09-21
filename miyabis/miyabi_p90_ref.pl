#!/usr/bin/perl

use strict;
use warnings;
use feature 'say';

my $clannad = "anpan";
my @shaft = ('madomagi', 'hidamari', 'nisekoi');
my %jojo = (jotaro => 'star platinum', josuke => 'crazy diamond');

my $clannad_ref = \$clannad;
my $shaft_ref = \@shaft;
my $jojo_ref = \%jojo;

say "$$clannad_ref";
say "$shaft_ref->[0]";
say "$jojo_ref->{jotaro}";

