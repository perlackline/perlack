#!/usr/bin/perl

use strict;
use warnings;
use utf8;

use Devel::Peek;

#use open OUT => ':encoding(sjis)';
#use open OUT => ':encoding(iso-8859-7)';
#use open OUT => ':encoding(iso-2022-jp)';
use open IN => ':encoding(shiftjis)';
open my $fh, "<", "txt_sjis" or die "$!";
my @line = <$fh>;
close $fh;

#Devel::Peek::Dump($_) for @line;
#Devel::Peek::Dump($line[0]);
#Devel::Peek::Dump($line[1]);

#use Encode;
#my @line_dec = map { decode('sjis', $_) } @line;
#print map{ encode('utf-8', $_)}@line, "\n"; 
print "$_\n" for @line;


