#!/usr/bin/perl

use strict;
use warnings;

my $dirname = 'mask772';

mkdir $dirname, 0772 or warn "Cannot make $dirname: $!";


