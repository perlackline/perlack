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

#print "--- Dumper b\n";
$b = Data::Dumper->new([$a],['c']);
#print Dumper $b;

#print "--- Dumper dmp_f\n";
#$dmp_f = $b->Freezer('Freeze');
$dmp_t = $b->Toaster('Thaw');
#print Dumper $dmp_f;
print Dumper $dmp_t;

#print "--- print \$c\n";
#$c = $b->Dump;
#print $c;



