#!/usr/bin/perl

use strict;
use warnings;

my $file = shift or die "please specify any file to argument:$!";

my $mode = (stat($file))[2];

print "mode is $mode\n";

my $classical_mode = 0777 & $mode;

printf "oct (classical): \nmode is %o\n", $classical_mode;

my $u_plus_x = $classical_mode | 0100;
printf "oct (u_plus_x): \nmode is %o\n", $u_plus_x;

my $u_only_x = ~$classical_mode & 0100;
printf "oct (u_only_x): \nmode is %o\n", $u_only_x;
printf "bin (u_only_x): \nmode is %b\n", $u_only_x;
