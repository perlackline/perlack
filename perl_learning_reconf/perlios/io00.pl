#!/usr/bin/perl

use strict;
use warnings;

open my $fh, '>', 'test' or die "$!";
print $fh "hello\n";
my @layers = PerlIO::get_layers($fh, output => 1);
close $fh;

print "out: @layers\n";

open my $fh_in, '<', 'test' or die "$!";
my @line = <$fh_in>;
my @layers_in = PerlIO::get_layers($fh_in);
close $fh_in;

print "in: @layers_in\n";



