#!/usr/bin/perl
use strict;
use warnings;
#use utf8;
#binmode STDOUT, ':utf8';
my $text = '漢字、カタカナ、ひらがなの混じったtext';

# utf8, binmode, parsing 1 char by Unicode
# カタカナ
#print substr($text,3,4);

# no utf8, no binmode, parsing 1 char by 1 octet
# カタカナ
print substr($text,9,12);
