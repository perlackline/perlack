#!/usr/bin/perl

use strict;
use warnings;

# current dir $B$N%U%!%$%k$N$&$AJ8;z%3!<%I$,(B ISO-2022-JP $B$N(B
# $B$b$N$r<hF@$9$k(B
chomp(my @line = `nkf -g * | grep ISO-2022-JP`);
for (@line) {
  print "$_\n";
}

