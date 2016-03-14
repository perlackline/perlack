#!/usr/bin/perl

use strict;
use warnings;

use Data::Dumper;
my $hoge = [ [1,2,3,4],[10,20,30] ];
open my $fh, '>', 'dump.txt' or die "$!";
print $fh Data::Dumper->new([$hoge])->Terse(1)->Indent(0)->Dump();

