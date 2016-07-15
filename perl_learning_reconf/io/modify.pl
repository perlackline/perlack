#!/usr/bin/perl

use strict;
use warnings;

# カレントファイル内の文字列置換

my $word = 'massage';
my @files;
map{ 
  push @files,$_ if -f && `cat $_ | grep $word` && $_ ne $0; 
} <*>;

print "modified: $_\n" for @files;

foreach my $file (@files){
  open my $fh_in, '<', $file or die "Could not open $file: $!";
  my @lines = <$fh_in>;
  close $fh_in;

  open my $fh_out, '>', $file or die "Could not open $file: $!";
  foreach my $line (@lines){
    $line =~ s/massage/message/g;
    print $fh_out $line;
  }
  close $fh_out;
}

