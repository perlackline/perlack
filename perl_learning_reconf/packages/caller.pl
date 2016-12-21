#!/usr/bin/perl

use strict;
use warnings;

print "get: package, filename, line\n";
func_name();

sub func_name {
  my ($package, $filename,$line) = caller;
  print "$_\n" for ($package,$filename,$line);
}

print "get: adding EXPR 10\n";
func_name2();

sub func_name2 {
#  my $i = 0;
#  while (my (
  my (
    $package,
    $filename,
    $line,
    $subroutine,
    $hasargs,
    $wantarray,
    $evaltext,
    $is_require,
    $hints,
    $bitmask,
    $hinthash,
  ) = caller(0);
#  ) = caller($i) ) {
#
    print "package   : ", $package,"\n";
    print "filename  : ", $filename,"\n";
    print "line      : ", $line,"\n";
    print "subroutine: ", $subroutine,"\n";
    print "hasargs   : ", $hasargs,"\n";
    print "wantarray : ", $wantarray,"\n";
    print "evaltext  : ", $evaltext,"\n";
    print "is_require: ", $is_require,"\n";
    print "hints     : ", $hints,"\n";
    print "bitmask   : ", $bitmask,"\n";
    print "hinthash  : ", $hinthash,"\n";
#
#    print "---\n";
#    print "$i\n";
#    print "---\n";
#
#    $i++;
#
#  }
}

