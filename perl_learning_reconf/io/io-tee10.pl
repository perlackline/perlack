#!/usr/bin/perl

use strict;
use warnings;

use IO::Tee;

my $tee = new IO::Tee('</etc/passwd', \*STDOUT);
my @lines = <$tee>;
#print scalar(@lines);
