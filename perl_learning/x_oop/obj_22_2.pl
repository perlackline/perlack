#!/usr/bin/perl

use strict;
use warnings;

my %hash = ();
($hash{$_}  = 0) for qw(wins places shows losses);

use Data::Dumper;

print Dumper(%hash);

