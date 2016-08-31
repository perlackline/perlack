#!/usr/bin/perl

use strict;
use warnings;


{
  use IO::Tee;

  open my $fh_in,'<','text.in' or die "$!";
  open my $fh_out1,'>','text.out1' or die "$!";
  
  my $tee = IO::Tee->new($fh_in, $fh_out1);
  
  chomp(my @lines = <$tee>);
  
  #print "$_\n" for @lines;
}

open my $fh, '<', 'text.out1' or die "$!";

#chomp(my @lines = <$fh>);

#print "$_\n" for @lines;
print <$fh>;

