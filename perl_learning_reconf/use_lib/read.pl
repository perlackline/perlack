#!/usr/bin/perl

use strict;
use warnings;

print "Printed this with read.pl\n";

{
  open my $fh, '<', 'print.pl' or die "print.pl: $!";
  #local $/; # 一気飲みモード
  #$/ = undef; # 一気飲みモード
  undef $/; # 一気飲みモード
  my $more_code = <$fh>;
  close $fh;
  eval $more_code;
  die $@ if $@;
}
#eval `cat print.pl`;
#die $@ if $@;

