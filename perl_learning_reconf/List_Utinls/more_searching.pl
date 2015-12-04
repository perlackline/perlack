#!/usr/bin/perl

use strict;
use warnings;

use List::MoreUtils ':all';

#my @a = qw(1 3 5 7 9 10 11);
#my @a = qw(a a b b c d d );
my @a = qw(one two two three);
#my @a = qw(1 3 5 11 12 13 17 22 25 28);

#my @x = lastidx { $_ == 3 } @a;
#my @x = onlyidx { $_ == 4 } @a;
#my @x = firstidx { $_ > 10 } @a;
#my @x = indexes { $_ > 2 } @a;
#my @x = lastres { $_ eq 'three' }@a;
#my @x = onlyres { $_ eq 'three' }@a;
#my @x = firstres { $_ eq 'two' }@a;
#my @x = lastval { 1 < $_ && $_ < 4 }@a;
#my @x = onlyval { 1 < $_ && $_ < 3 }@a;
#my @x = firstval { length > 2 } @a;
#my $x = firstval { $_ > 8 } @a;
my @x = bsearch { $_ eq 'one' } @a;
my $x = bsearch { $_ eq 'one' } @a;
#my @x = bsearchidx { $_ == 6 } @a;

print "\@x : @x\n";
print "\$x : $x\n";

