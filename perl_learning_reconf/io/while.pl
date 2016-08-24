#!/usr/bin/perl

use strict;
use warnings;

use IO::File;

my @handlepairs = 0..5;

while (@handlepairs){
  print "nums: @handlepairs\n";
$DB::single=2;
  @handlepairs = grep{ 
    #if (defined($_ < 3)){
    if ($_ < 3){
     print "\$_: $_\n";
     $_++;
    }else{
      0;
    }
  } @handlepairs;


}

$DB::single=2
