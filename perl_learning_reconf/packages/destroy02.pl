#!/usr/bin/perl

use strict;
use warnings;

# check destroy
# via perlobj

package Subtle;
sub new {
  my $test;

  # 自己参照 ( 参照カウントを増やす )
  $test = \$test;
  warn "CREATING ". \$test;

  # $test の参照カウントは 2
  return bless \$test;
}

sub DESTROY {
  my $self = shift;
  warn "DESTROYING $self";
}

package main;

warn "starting program";
{
  my $a = Subtle->new;
  my $b = Subtle->new;

use Data::Dumper;

print "\n---\n";
print Data::Dumper->Dump([$a, $b],[qw(*a *b)]);
print "---\n\n";

  $$a = 0;  # break selfref ( 自己参照を壊す )
  warn "leaving block";

print "\n---\n";
print Data::Dumper->Dump([$a, $b],[qw(*a *b)]);
print "---\n\n";

}

print "\n---\n";
print Data::Dumper->Dump([$a, $b],[qw(*a *b)]);
print "---\n\n";

warn "just exited block";
warn "time to die...";
exit;

