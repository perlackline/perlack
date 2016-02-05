#! /usr/bin/perl

use strict;
use warnings;


#$\ = "\n";

#binmode STDOUT, ':encoding(utf8)';
#use Encode;
#use Encode::Guess qw/euc-jp shiftjis 7bit-jis/;
#Encode::Guess->set_suspects(qw/euc-jp shiftjis 7bit-jis/);
use Encode::Guess;
while(<>){
  chomp;
  my $enc = guess_encoding($_, qw/euc-jp shiftjis 7bit-jis/);
  ref($enc) or die "[$_] Can't guess: $enc";

  my $str_dec = $enc->decode($_);
  my $str_enc  = Encode::encode('utf-8', $str_dec);

  print "$str_enc\n";
}

