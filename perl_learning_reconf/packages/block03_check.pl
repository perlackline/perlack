#!/usr/bin/perl

use strict;
use warnings;

#use outer;
#require 'outer.pl';
#BEGIN{ require 'outer.txt' }
#require outer;
#BEGIN{ require 'outer.pm'}

#my $arg = shift;
#eval $arg;

#BEGIN{ 
#  eval 'outer.txt';
#  eval `cat outer.txt`;
#  die $@ if $@; }

#BEGIN {
#  open my $fh, '<', 'outer.txt' or die "outer.txt: $!";
#  local $/;  # 一気飲みモード
#  my $more_code = <$fh>;
#  close $fh;
#  eval $more_code;
#}

print "-- first print\n";

print "-- second print\n";


CHECK { print "-- CHECK block\n" }

sub test_check { print "test_check\n"; CHECK{ print "test_checks CHECK\n" } }
test_check();




