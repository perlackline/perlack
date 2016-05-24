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

#$a->Freeze->Thaw;
print "-- aa = a->Freeze --\n";
$aa = $a->Freeze;

print "-- a->Thaw --\n";
$a->Thaw;
print "-- aa->Freeze--\n";
$aa->Freeze;
print "-- aa->Thaw--\n";
$aa->Thaw;


print "\n-----------\n\n";
# パッケージ Foo のオブジェクト $a のデータを
# 名前 c で Data::Dumper オブジェクトとして
# $b に格納.
$b = Data::Dumper->new([$a],['c']);

$b->Freezer('Freeze');
#$b->Toaster('Thaw');
#$c = $b->Dump;
#print $c;
#$d = eval $c;
#print Data::Dumper->Dump([$d],['d']);


