#!/usr/bin/perl

use strict;
use warnings;

sub skipper_greets {
  my $person = shift;
  print "Skipper: Hey there, $person!\n";
}
sub gilligan_greets {
  my $person = shift;
  if ($person eq "Skipper") {
    print "Gilligan: Sir, yes, sir, $person!\n";
  } else {
    print "Gilligan: Hi, $person!\n";
  }
}
sub professor_greets {
  my $person = shift;
  print "Professor: By my caluculations, you must be $person!\n";
}

skipper_greets("Gilligan");
gilligan_greets("Skipper");
professor_greets("Skipper");
professor_greets("Gilliban");
