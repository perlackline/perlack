#!/usr/bin/env perl

use strict;
use warnings;

my $osaka = [ qw(nqounet boolfool) ];
my $tokyo = [ qw(macpy papix) ];
my @perl_entrance = ($osaka, $tokyo);

print "-------------\n";
print $perl_entrance[0][0], " : ", $perl_entrance[0][1], "\n";
print $perl_entrance[1][0], " : ", $perl_entrance[1][1], "\n";
print "-------------\n";

use Data::Dumper;
print "-------------@\n";
warn Dumper @perl_entrance;
print "-------------[0]\n";
warn Dumper $perl_entrance[0];
print "-------------[1]\n";
warn Dumper $perl_entrance[1];

print "-------------DDP\n";
use DDP;
p @perl_entrance;

