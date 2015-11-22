#!/usr/bin/perl

use strict;
use warnings;

use Try::Tiny;

eval { die "die !!\n" };

print "\$\@: $@";

eval { print "eval successful.\n" };

print "\$\@: $@";

print "\n";
