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
  $s->{state} = 'thaw';
  return bless $s, 'Foo';
}

# ---------------------------------

package main;
#package main;
use Data::Dumper;

# Foo のオブジェクト
$a = Foo->new;

#$a->Freeze;
#$a->Thaw;
$b = Data::Dumper->new([$a],['a']);
$b->Freezer('Freeze');
print "---\n";
#print $b->Dump;
$b->Toaster('Thaw');
$c = $b->Dump;
print "---\n";
print Dumper $c;
print "---\n";
$d =  eval $c;
print "---\n";

print Dumper $d;

print Data::Dumper->Dump([$d], ['d']);

