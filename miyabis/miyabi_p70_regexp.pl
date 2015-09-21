#!/usr/bin/perl

use strict;
use warnings;
use feature 'say';

my $text = "Joseph::Joseph::Jotaro";

my @jojo = split /:./, $text;
say "@jojo";

