#!/usr/bin/perl

use strict;
use warnings;

use IO::Tee;

#open my $fh_out,'>','text.out2' or die "$!";

#my $tee = new IO::Tee(\*STDOUT, ">text.out", $fh_out);
my $tee = new IO::Tee(">text.out1",">text.out2",">text.out3",">text.out4");

my @handles = $tee->handles;

print $handles[0],"\n";
print $handles[1],"\n";
print $handles[2],"\n";
print $handles[3],"\n";

print scalar(@handles),"\n";
print $#handles,"\n";

#foreach ($tee->handles){
#  print "$_\n";
#}
$tee->print("good\n");

print join('/-/',$tee->handles), "\n";

