#!/usr/bin/perl

use strict;
use warnings;

my @ary0 = qw(its been a long time);

my @ary1 = ('ary0', \@ary0);
my @ary2 = ('ary1', \@ary1);
my @ary3 = ('ary2', \@ary2);
my @ary4 = ('ary3', \@ary3);

print "@{${${${$ary4[1]}[1]}[1]}[1]}\n";
print "@{$ary4[1]->[1]->[1]->[1]}\n";
print "@{$ary4[1][1][1][1]}\n";

push @{$ary4[1][1][1][1]}, ". I'm glad to see you.";
print "@{$ary4[1][1][1][1]}\n";

my @other_ary = map { $_ } @{$ary4[1][1][1][1]};
map{ print "$_\n" } @{$ary4[1][1][1][1]};

#print "@{$ary4[1]->[1]}\n";

#print "#---------------\n";
#print $ary4[0], "\n";
#print $ary4[1]->[0], "\n";
#print $ary4[1]->[1]->[0], "\n";
#print $ary4[1]->[1]->[1]->[0], "\n";
#
#print $ary4[1], "\n";
#print $ary4[1]->[1], "\n";
#print $ary4[1]->[1]->[1], "\n";
#print "@{$ary4[1][1][1][1]}\n";
#
##use Data::Dumper;
##print Dumper @ary4;
#
