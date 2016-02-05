#!/usr/bin/perl

use strict;
use warnings;
use utf8;

#binmode STDOUT, ':utf8';

my $chr = '»';
#my $chr = 'é';

my @codepoint = unpack('U', $chr);

map{ printf "%04x\n", $_ }@codepoint;
