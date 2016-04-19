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

package main;
use Data::Dumper;
$a = Foo->new;
print $a->{state}, "\n";

print "--- Dumper b\n";
$b = Data::Dumper->new([$a],['c']);
print Dumper $b;

print "--- Dumper dmp_f\n";
$dmp_f = $b->Freezer('Freeze');
#$b->Toaster('Thaw');
print Dumper $dmp_f;

print "--- print \$c\n";
$c = $b->Dump;
print $c;

print "--- eval \$c\n";
$d = eval $c;
print $c->{state}, "\n";
#$c->Freeze, "\n";
#$c->Thaw, "\n";
print $c->{state}, "\n";
#print Data::Dumper->Dump([$d],['d']);


