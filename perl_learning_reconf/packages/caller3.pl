#!/usr/bin/perl

use strict;
use warnings;

eval 'func_name_4';

sub func_name_4 {
  func_name_3();
}
sub func_name_3 {
  func_name_2();
}
sub func_name_2 {
  func_name_1();
}
sub func_name_1 {
  func_name_0();
}

sub func_name_0 {
  my $i = 0;
  while (my @array 
#  my (
#    $package,
#    $filename,
#    $line,
#    $subroutine,
#    $hasargs,
#    $wantarray,
#    $evaltext,
#    $is_require,
#    $hints,
#    $bitmask,
#    $hinthash,
#  ) = caller(0);
#  ) = caller($i) ) {
   = caller($i) ) {

    print "package   : ", $array[0], "\n" if $array[0];
    print "filename  : ", $array[1], "\n" if $array[1];
    print "line      : ", $array[2], "\n" if $array[2];
    print "subroutine: ", $array[3], "\n" if $array[3];
    print "hasargs   : ", $array[4], "\n" if $array[4];
    print "wantarray : ", $array[5], "\n" if $array[5];
    print "evaltext  : ", $array[6], "\n" if $array[6];
    print "is_require: ", $array[7], "\n" if $array[7];
    print "hints     : ", $array[8], "\n" if $array[8];
    print "bitmask   : ", $array[9], "\n" if $array[9];
    print "hinthash  : ", $array[10], "\n" if $array[10];
#    print "package   : ", $package,"\n"; #    print "filename  : ", $filename,"\n";
#    print "line      : ", $line,"\n";
#    print "subroutine: ", $subroutine,"\n";
#    print "hasargs   : ", $hasargs,"\n";
#    print "wantarray : ", $wantarray,"\n";
#    print "evaltext  : ", $evaltext,"\n";
#    print "is_require: ", $is_require,"\n";
#    print "hints     : ", $hints,"\n";
#    print "bitmask   : ", $bitmask,"\n";
#    print "hinthash  : ", $hinthash,"\n";

    print "---\n";
    print "$i\n";
    print "---\n";

    $i++;

  }
}

