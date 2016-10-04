#!/usr/bin/perl

use strict;
use warnings;

#my $flag = 0;

#unless ($flag){
#  die "\$flag = $flag";
#}
my $arg = shift;
eval $arg;
die $@ if $@;

END { print "END block\n" }


print "first print\n";

print "second print\n";

#my $arg = shift;
#eval $arg;
#die $@ if $@;

#require 'outer.txt';

