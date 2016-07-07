#!/usr/bin/perl

use strict;
use warnings;

# from Python

my $my_callback = sub {
  my $val = shift;
  print "function my_callback was called with $val\n";
};

my $caller = sub {
  my $val = shift;
  my $func = shift;

  # my_callback をコールバック
  $func->($val);
};

for my $i (0..4){
  $caller->($i,$my_callback);
}

