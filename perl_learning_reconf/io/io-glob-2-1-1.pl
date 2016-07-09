#!/usr/bin/perl

use strict;
use warnings;

my $file = 'text';
open LOG_FH, ">> $file" or die "could not open $file: $!";

print *LOG_FH{SCALAR}, "\n";
print *LOG_FH{ARRAY}, "\n";
print *LOG_FH{HASH}, "\n";
print *LOG_FH{CODE}, "\n";
print *LOG_FH{IO}, "\n";
print *LOG_FH{GLOB}, "\n";
print *LOG_FH{FORMAT}, "\n";
print *LOG_FH{NAME}, "\n";
print *LOG_FH{PACKAGE}, "\n";

print "---\n";
