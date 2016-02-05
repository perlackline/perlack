#! /usr/bin/perl

use strict;
use warnings;
use Encode::Guess;
$\ = "\n";
while(<>){
  my $enc = guess_encoding($_, qw/euc-jp shiftjis 7bit-jis/);
  print ref $enc ? $enc->name : $enc;
}

