#!/usr/bin/perl

use strict;
use warnings;

use IO::File;

my $file_in = 'text.file';
my $file_out = 'text.out';
my $fh = [
          #(IO::File->new("< $file_in") or die "$!"),
          #(IO::File->new("> $file_out") or die "$!"),
          IO::File->new("<$file_in") or die "$!",
          IO::File->new(">$file_out"),
         ];

my @lines = $fh->[0]->getlines;

print @lines;

#print ${$fh}[1] $_ for @lines;
#${$fh}[1]->print($_) for @lines;

#$fh->[1]->print($lines[2]); 

#$fh->[1]->print($_) for @lines;
#print {$fh->[1]} $_ for @lines;

#close $fh->[0];
#close $fh->[1];
print "---\n";

use Data::Dumper;
print Dumper $fh;
print "--- text.out ---\n";
#open my $fh_chk, '<', $file_out or die "$!";
#my @lines2 =  <$fh_chk>;
#print "$_" for @lines2;

print "---\n";

#use Devel::Peek;

#print Dump $fh;
