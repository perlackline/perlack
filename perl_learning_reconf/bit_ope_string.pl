#!/usr/bin/perl

use strict;
use warnings;

print "a" | "b", "\n";
print "0x61" | "0x62", "\n";
printf "%s\n", chr(0x61 | 0x62);

