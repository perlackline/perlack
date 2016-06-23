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

my $anon_ref = sub { print "hello, anonymous ref.\n" };

my $anon_ref2 = \&raraiya_greets;

&$anon_ref2 ('Aida');
#&$anon_ref;
#$anon_ref->();

#print &{sub{"yes, yes!\n"}};
