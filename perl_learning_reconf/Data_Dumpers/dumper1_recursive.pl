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

# avoid cross-refs
#$Data::Dumper::Purity= 0;
print Data::Dumper->Dump([$b,$a],[qw(*b a)]);

## avoid cross-refs
#$Data::Dumper::Deepcopy = 1;
#print Data::Dumper->Dump([$b,$a],[qw(*b a)]);

## fill in the holes for eval
#$Data::Dumper::Purity = 1;
## print as @a
#print Data::Dumper->Dump([$a,$b],[qw(*a b)]);
#print "--- ---\n";
## print as %b
#print Data::Dumper->Dump([$b,$a],[qw(*b a)]);
#
##print Data::Dumper->Dump([$a,$b,$c],[qw(a b c)]);



