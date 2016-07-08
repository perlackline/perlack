#!/usr/bin/perl

use strict;
use warnings;

my $file = 'text';
open my $log_fh, ">>", $file or die "could not open $file: $!";

print $log_fh, "\n";

print "---\n";

my $a = $log_fh;

print "$a\n";


