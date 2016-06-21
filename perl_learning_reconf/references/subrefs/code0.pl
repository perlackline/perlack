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

bellri_greets("Aida");
bellri_greets("Raraiya");
print "\n";
aida_greets("Bellri");
aida_greets("Raraiya");
print "\n";
raraiya_greets("Bellri");
raraiya_greets("Aida");
