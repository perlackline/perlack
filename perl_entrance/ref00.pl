#!/usr/bin/env perl

use strict;
use warnings;

my $osaka = [ qw(nqounet boolfool) ];
my $tokyo = [ qw(macopy papix) ];
my @perl_entrance = ($osaka, $tokyo);
print $perl_entrance[1][1], "\n"; # papix

# [0][0] $B$O(B nqounet
# [0][1] $B$O(B boolfool
# [1][0] $B$O(B macopy
# [1][1] $B$O(B papix
