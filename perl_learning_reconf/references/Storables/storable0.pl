#!/usr/bin/perl

my %table = (
    key1 => 'val1',
    key2 => { key21 => 'val21', key22 => 'val22'},
    key3 => 'val3',
);

use Storable qw(dclone freeze thaw);

my $ref = \%table;
my $cloneref = dclone($ref);

my $serialized = freeze \%table;
my %table_clone = %{ thaw($serialized) };

#store \%table, 'file';
#my $hashref = retrieve('file');

use Data::Dumper;
print Dumper $cloneref;
#print Dumper $hashref;
use YAML;
print Dump \%table_clone;

