#!/usr/bin/perl

use strict;
use warnings;

use IO::File;

my @handlepairs;

#chdir 'dir' or die;
foreach my $file ( glob( 'dir/*.input' )){
  (my $out = $file) =~ s/\.input$/.output/;
  push @handlepairs,[
    (IO::File->new("<$file") || die),
    (IO::File->new(">$out") || die),
  ];
}

#while (@handlepairs){
#  @handlepairs = grep {
#    if (defined(my $line = $_->[0]->getline)){
#      print { $_->[1] } $line;
#    } else {
#      0;
#    }
#  } @handlepairs;
#}

# 良い書き方 (複雑に参照された値は単純なスカラにコピーする)
while (@handlepairs){
  @handlepairs = grep {
    my($IN,$OUT) = @$_;
    my $line;
    defined($line = <$IN>) and print $OUT $line;
  } @handlepairs;
}


