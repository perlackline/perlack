#!/usr/bin/perl

use strict;
use warnings;
use Animal;

# check destroy

sub feed_a_cow_named{
  my $name = shift;
  my $cow = Cow->named($name);
  $cow->eat('grass');
  $cow->self_ref;
  print "Returning from the subroutine.\n";

  # $cow が破棄される 
use Data::Dumper;
print Data::Dumper->Dump([$cow],[qw(*cow)]);
}

print "Start of program.\n";
my $outer_cow = Cow->named('Bessie');
print "Now have a cow named ", $outer_cow->name, ".\n";
feed_a_cow_named('Grew');
print "Returned from subroutine.\n";

exit;

