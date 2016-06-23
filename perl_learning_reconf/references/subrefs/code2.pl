#!/usr/bin/perl

use strict;
use warnings;

sub bellri_greets {
  my $person = shift;
  print "Bellri: Hey there, $person!\n";
}
sub aida_greets {
  my $person = shift;
  if ($person eq "Bellri") {
    print "Aida: $person !?, Rayhumton ... ?\n";
  } else {
    print "Aida: Hi, $person!\n";
  }
}
sub raraiya_greets {
  my $person = shift;
  print "Raraiya: $person? ... Chuchumy!\n";
}

sub no_takes_args {
  print "this routine takes no args!\n";
}

my $no_args = \&no_takes_args;

&{$no_args};
#$no_args->();
