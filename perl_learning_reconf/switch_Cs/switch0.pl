#!/usr/bin/perl -C

use strict;
use warnings;

use utf8;

print "Please enter something\nSTDIN : ";

chomp(my $line = <STDIN>);

$line =~ s/にちは/ばんわ/;

print "STDOUT: $line\n";

