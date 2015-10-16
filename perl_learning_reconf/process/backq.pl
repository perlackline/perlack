#!/usr/bin/perl

use strict;
use warnings;

my @opts = '-i';
my $search_string = 'strict';
my @filenames = <*>;
open my $grep, "-|", 'grep', @opts, $search_string, @filenames;
chomp(my @ok = <$grep>);
close $grep;

print "$_\n" for @ok;

