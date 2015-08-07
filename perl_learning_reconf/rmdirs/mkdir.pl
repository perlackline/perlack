#!/usr/bin/perl

use strict;
use warnings;

my $dir_name = "$0_$$";

mkdir $dir_name, 0700 or die "Cannot careate $dir_name: $!";
