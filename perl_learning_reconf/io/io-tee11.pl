#!/usr/bin/perl

use strict;
use warnings;

use IO::Tee;

open my $fh_out,'>','text.out2' or die "$!";

my $tee = new IO::Tee(\*STDOUT, ">text.out", $fh_out);

my @handles = $tee->handles;

print "----\n";
print $handles[0],"\n";
print $handles[1],"\n";
print $handles[2],"\n";

print scalar($tee->handles),"\n";
#print scalar(@handles),"\n";
print $#handles,"\n";

print "----\n";
#foreach ($tee->handles){
#  print "$_\n";
#}
#$tee->print("hello\n");
$handles[0]->print( "STDOUT?\n");
$handles[1]->print( "text.out?\n");
print "----\n";

print join('/-/',$tee->handles), "\n";

