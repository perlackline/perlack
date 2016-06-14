#!/usr/bin/perl

use strict;
use warnings;

my %hash = ( key1=>'val1', key2=>'val2' );

my @array = ( 'elm0', \%hash, 'elm2' );

my @array_cpy = @array;

print "---origin---\n";
print map{ "$_\n" } @array;
print "---cpy---\n";
print map{ "$_\n" } @array_cpy;

use Storable qw/dclone/;

my $array_dclone = dclone(\@array);
#my @array_dclone = @{dclone(\@array)};

print "---dclone---\n";
print map{ "$_\n" } @{$array_dclone};
#print map{ "$_\n" } @array_dclone;

print "--- ---\n";
$array_dclone->[1]{key1} = 'foo';
# val1
print "$array[1]{key1}\n";

