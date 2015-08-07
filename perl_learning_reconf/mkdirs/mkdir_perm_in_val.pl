#!/usr/bin/perl

use strict;
use warnings;

print "Please enter a dirname\nhere-->";
chomp (my $dirname = <STDIN>);
print "Please enter a permission\nhere-->";
chomp (my $mask = <STDIN>);

mkdir $dirname, oct($mask) or warn "Cannot make $dirname: $!";

print "\n--> Created $dirname\n--> perm: $mask\n";
print "(*) perm is automatically-adjusted according to 'umask'.\n\n";

