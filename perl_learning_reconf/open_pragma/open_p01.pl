#!/usr/bin/perl

use strict;
use warnings;
use utf8;

use Encode;
use Devel::Peek;

#use open OUT => ':encoding(sjis)';
#use open OUT => ':encoding(iso-8859-7)';
#use open OUT => ':encoding(iso-2022-jp)';
use open IO => ':encoding(utf-8)';

open my $in, "<", "txt_utf8" or die "$!";
my @line = <$in>;
close $in;

open my $out, ">", "txt_utf8_2" or die "$!";
foreach my $line (@line){
  $line =~ s/にちは/ばんわ/;
  print $out "$line";
 } 
#print map { Dump $_ } @line;
#Dump @line;

close $out;

