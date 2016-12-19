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

  # $a の参照カウントは 2
  # $b の参照カウントは 2

  # 参照カウントを減らす
  $$a = 0;  # break selfref ( 自己参照を壊す )
  warn "leaving block";
}
# $a の参照カウントは 0
# $b の参照カウントは 1 残る

warn "just exited block";
warn "time to die...";
exit;

