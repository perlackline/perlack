#!/usr/bin/perl

use strict;
use warnings;

use lib './';
use Person;

# $B%*%V%8%'%/%H$OLdBj$J$/:n@.$5$l$k(B
my $obj = Person->new();

$obj->{NAME}  = "jem";
$obj->{AGE}   = 22;
$obj->{PEERS} = [qw(jon jan jin)];

print $obj->{NAME}, "\n";
print $obj->{AGE}, "\n";
print @{$obj->{PEERS}}, "\n";
print $obj->{PEERS}[0], "\n";
print $obj->{PEERS}[1], "\n";
print $obj->{PEERS}[2], "\n";

