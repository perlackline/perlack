#!/usr/bin/perl

use strict;
use warnings;

use Try::Tiny;

my $exp ='4/0';
my $result = 0;

my $what =
try {
  print "try\n";
  $result = (eval $exp);
  print "$result\n";
}
catch {
  print "\$_: ", $_, "\n";
}
finally {
  print @_ ? 'There was an error' : 'Everything worked';
};

print "$what\n";

