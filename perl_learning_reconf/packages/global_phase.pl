#!/usr/bin/perl

use strict;
use warnings;

BEGIN { print "compile-time: ${^GLOBAL_PHASE}\n" }

INIT { print "init-time: ${^GLOBAL_PHASE}\n" }

CHECK { print "check-time: ${^GLOBAL_PHASE}\n" }

{
  package Print::Phase;

  sub new {
      my ($class, $time) = @_;
      return bless \$time, $class;
  }

  sub DESTROY {
      my $self = shift;
      print "$$self: ${^GLOBAL_PHASE}\n";
  }
}

print "run-time: ${^GLOBAL_PHASE}\n";

my $runtime = Print::Phase->new(
    "lexical variables are garbage collected before END"
);

END { print "end-time: ${^GLOBAL_PHASE}\n" }

our $destruct = Print::Phase->new(
    "package variables are garbage collected after END"
);




