#!/usr/bin/perl

#use strict;
#use warnings;

########
# persistence
########

package Foo;
sub new{ bless{ state => 'awake', name => 'dafault' },shift }
sub Freeze {
  my $s = shift;
  print STDERR "preparing to sleep\n";
  $s->{state} = 'asleep';
  return bless $s, 'Foo::ZZZ';
}
sub name {
  my $self = shift;
print STDERR "?? Foo\n";
  $self->{state} = 'in-name';
  $self->{name} = shift if @_;
  $self->{name};
  return bless $self, 'Foo::ZZZ';
}

package Foo::ZZZ;
sub Thaw {
  my $s = shift;
  print STDERR "waking up\n";
  $s->{state} = 'awake';
  return bless $s, 'Foo';
}
sub name {
  my $self = shift;
  $self->{state} = 'in-zzz-name';
print STDERR "??Foo::ZZZ\n";
  $self->{name} = shift if @_;
  $self->{name};
  return bless $self, 'Foo';
}

# ---------------------------------

package main;
#package main;
use Data::Dumper;

# Foo のオブジェクト
$a = Foo->new;

# Foo のインスタンスのデータ構造を
# Data::Dumper のインスタンスにする.
$b = Data::Dumper->new([$a],['c']);


# ! Freezer は, DD objct の内容のメソッドを任意に指定する !
$b->Freezer('Freeze');
#$b->Freezer('name');
$b->Toaster('name');
#$b->Toaster('Thaw');

$c =  $b->Dump;

$a->name('JoJo');

print $c;
$d = eval $c;
print Data::Dumper->Dump([$d],['d']);

