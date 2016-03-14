#!/usr/bin/perl

use strict;
use warnings;

use Storable;
my $rec = retrieve 'data01';
use Data::Dumper;
print Dumper $rec;

