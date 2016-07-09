#!/usr/bin/perl

use strict;
use warnings;

my $file = 'text';
open LOG_FH, ">> $file" or die "could not open $file: $!";

print *LOG_FH, "\n";
print \*LOG_FH, "\n";
print LOG_FH;

print "---\n";

my $a = *LOG_FH;
my $b = \*LOG_FH;

print "$a\n";
print "$b\n";


