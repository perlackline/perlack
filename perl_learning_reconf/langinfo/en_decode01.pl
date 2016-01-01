#!/usr/bin/perl

use strict;
use warnings;
#use Encode;
use utf8;
binmode STDOUT, ":encoding(utf8)";
for my $argv (@ARGV){
  open my $fh, "<:encoding(utf8)", $argv or die "$argv: $!";
  while(<$fh>){
#print encode("utf8", $_);
print;
    s{(?:小飼|こがい|コガイ|Kogai)
      [\s\x{3000}]* # \s + FULLWIDTH SPACE
      (?:弾|だん|ダン|Dan)
     }{Encode Maintainer}gmsx;    
  #print encode("utf8", $_);
  print;
  }
}

