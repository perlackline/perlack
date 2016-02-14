#!/usr/bin/perl

use strict;
use warnings;

# ワードの置換 for current dir files.

my @files =  <*>;
my $form = 'from word for substitution';
my $to   = 'to word for substitution';
my $myself = 'substitution.pl';

foreach my $file (@files) {
  if ( -f $file) {
    # 一気飲みモード
    local $/;
    open my $fh_in, '<', $file or die "$!";
    my $lines = <$fh_in>;
    close $fh_in;

    if ($file ne $myself && $lines =~ /$form/) {
      print "\n=== $file ===\n";
      open my $fh_out, '>', $file or die "$!";
      $lines =~ s/$form/$to/g;
      print $fh_out $lines;
      close $fh_out;
      print $lines;
    }
  }
}
