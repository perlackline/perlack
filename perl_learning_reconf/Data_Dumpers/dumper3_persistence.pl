#!/usr/bin/perl

#use strict;
#use warnings;

########
# persistence
########

package Foo;
sub new{ bless{ state => 'awake' },shift }
sub Freeze {
  my $s = shift;
  print STDERR "preparing to sleep\n";
  $s->{state} = 'asleep';
  return bless $s, 'Foo::ZZZ';
}

package Foo::ZZZ;
sub Thaw {
  my $s = shift;
  print STDERR "waking up\n";
  $s->{state} = 'awake';
  return bless $s, 'Foo';
}

# ---------------------------------

package main;
#package main;
use Data::Dumper;

# Foo のオブジェクト
$a = Foo->new;

$b = $a->Freeze;

$b->Thaw;
