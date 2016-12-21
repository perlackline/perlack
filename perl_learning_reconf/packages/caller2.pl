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
  while (my (
#  my (
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
#  ) = caller(0);
  ) = caller($i) ) {

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

    print "---\n";
    print "$i\n";
    print "---\n";

    $i++;

  }
}

