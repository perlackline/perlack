#!/usr/bin/perl

use strict;
use warnings;

# leaning perl continue P.281

my @barnyard = ();
{
  print "enter an animal (empty to finish): ";
  chomp (my $animal = <STDIN>);
  print "before: $animal\n";
  $animal = ucfirst lc $animal;  # 正規化 (先頭文字大文字, 以降を小文字)
  print "after : $animal\n";
}
