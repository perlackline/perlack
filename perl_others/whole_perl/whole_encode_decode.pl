#!/usr/bin/perl
use strict;
use warnings;
use Encode;

my $bytes = '漢字、カタカナ、ひらがなの混じったtext';
print substr($bytes,9,12);
my $utf8 = decode('utf8', $bytes);
binmode STDOUT, ':utf8';
print substr($utf8,3,4);
