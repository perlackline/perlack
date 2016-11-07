#!/usr/bin/perl

use strict;
use warnings;

#use outer;
#require 'outer.pl';
#BEGIN{ require 'outer.txt' }
#require outer;
#require 'outer.txt';
#BEGIN{ require 'outer.pm'}

#my $arg = shift;
#eval $arg;
#die $@ if $@;

#BEGIN{ 
#  eval 'outer.txt';
#  eval `cat outer.txt`;
#  die $@ if $@;
#}

#BEGIN {
#  open my $fh, '<', 'outer.txt' or die "outer.txt: $!";
#  local $/;  # 一気飲みモード
#  my $more_code = <$fh>;
#  close $fh;
#  eval $more_code;
#}

test_check();

print "-- first print\n";

print "-- second print\n";

INIT { print "-- INIT block\n" }

sub test_check { print "test_check\n"; INIT{ print "test_checks INIT\n" } }




