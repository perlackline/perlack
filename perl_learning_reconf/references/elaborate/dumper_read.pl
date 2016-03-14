#!/usr/bin/perl

use strict;
use warnings;

{
open my $fh, '<', 'dump.txt' or die "$!";
local $\;
my $tv = <$fh>;
eval $tv;
use Data::Dumper;
print Data::Dumper->new([$tv])->Terse(1)->Indent(0)->Dump();
}

#use Storable;
#my $rec = retrieve 'data01';
#use Data::Dumper;
#print Dumper $rec;

