#!/usr/bin/perl

#use strict;
#use warnings;

use Data::Dumper;

########
# recursive structures
########

@c = ('c');
$c = \@c;

$b = {};

$a = [1,$b,$c];

$b->{a} = $a;
$b->{b} = $a->[1];
$b->{c} = $a->[2];

print Data::Dumper->Dump([$a,$b,$c],[qw(a b c)]);
#print Data::Dumper->Dump([$a,$b,$c]);

