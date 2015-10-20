#!/usr/bin/perl

use strict;
use warnings;

print "perl: $ENV{LANG}\n";
$ENV{LANG} = 'ja_JP.ujis';
system 'echo echo: $LANG';

