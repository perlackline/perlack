#!/usr/bin/perl

use strict;
use warnings;

my @ary1 = qw(one ichi);
my @ary2 = qw(two ni);

push @ary2, \@ary1;
push @ary1, \@ary2;

use Data::Dumper;

print "--- ary2 ---\n";
print Dumper @ary2;
print "--- ary1 ---\n";
print Dumper @ary1;

print "--- --- ---\n";
print $ary1[0], "\n";
print $ary1[2]->[2]->[0], "\n";
print $ary1[2]->[2]->[2]->[2]->[2]->[2]->[0], "\n";

print $ary1[2][2][2][2][2][2][2][2][2][2][2][2][2][2][2][2][2][2][2][2][2][2][2][2][0], "\n";

