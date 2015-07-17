#!/usr/bin/perl

use strict;
use warnings;

use re 'debug';

#foreach my $count ( 0..9 ) {
#  print "count: $count\n";
#
#}

my $string = 'Perl';

if ( $string =~ /^pe(a)*rl$/i ){
  print "Match!!!\n";
}
my $string2 = 'ABC';

if ( $string =~ /^perl$/i ){
  print "Match???\n";
}

