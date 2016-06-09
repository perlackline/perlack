#!/usr/bin/perl

use strict;
use warnings;

my @data1 = qw(one won);
my @data2 = qw(two too to);

# 循環参照
push @data2, \@data1;
push @data1, \@data2;

use Storable;
store [\@data1,\@data2], 'some_file';
