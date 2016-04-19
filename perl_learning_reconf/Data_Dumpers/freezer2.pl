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
# -----------------------------------------------

package main;
use Data::Dumper;

print "--- Foo ---\n";
$a = Foo->new;
$b = Data::Dumper->new([$a],['c']);
#$b->('Freeze');
$c = $b->Dump;
print $c->{state};

print "--- Foo->{state} ---\n";
print "a->{state}: ", $a->{state}, "\n";

print "--- Foo->Freeze() ---\n";
$a->Freeze();
print "a->{state}: ", $a->{state}, "\n";

print "--- Foo->Thaw() ---\n";
$a->Thaw();
print "a->{state}: ", $a->{state}, "\n";


