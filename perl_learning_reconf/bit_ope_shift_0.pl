#!/usr/bin/perl

use strict;
use warnings;

#my $file = shift or die "please specify any file to argument:$!";

#my $mode = (stat($file))[2];

my $bit = 511;
for( 0 .. 3 ) {
    printf "%09b\n", $bit;
    $bit >>= 3;
}  
print "\n";

$bit = 511;
for( 0 .. 3 ) {
    printf "%09b\n", $bit;
    $bit >>= 4;
}  
