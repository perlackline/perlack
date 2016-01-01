#!/usr/bin/perl

use strict;
use warnings;
use utf8;
use Encode;
for my $argv (@ARGV){
  open my $fh, "<", $argv or die "$argv: $!";
  while(<$fh>){
    my $utf8 = decode("utf8", $_);
print encode("utf8", $utf8);
    $utf8 =~ s{ (小飼|こがい|コガイ|Kogai)
                [\s\x{3000}]* # \s + FULLWIDTH SPACE
                (弾|だん|ダン|Dan)
              }{Encode Maintainer}gmsx;    
  print encode("utf8", $utf8);
  }
}

