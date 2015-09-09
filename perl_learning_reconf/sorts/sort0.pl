#!/usr/bin/perl

use strict;
use warnings;
use utf8;

use Encode;

my @num = sort { $a <=> $b } 99..101;
print "@num\n";

my @str = scalar reverse sort qw/あい お うえ/;



# print "@str\n";

push my @en_str, map { encode('utf-8', $_) } @str;
print "@en_str\n";
