#!/usr/bin/perl

use strict;
use warnings;

# check destroy
# inside-out object

# array

package SomeClass;

sub new {
  my $class = shift;
  #my $attr = { data1 => 'val1', data2 => 'val2' };
  my $attr = [ qw(elm1 elm2 elm3) ];
  bless $attr, $class;
}

# ゲッター
sub get_attrs {
  my $self = shift;
  my @elms = ();
  foreach my $elm ( @{$self} ){
    push @elms, $elm;
  }
  "@elms";
}

# ゲッター
sub get_data {
  my $self  = shift;
  my $index = shift;
  if($index =~ /[0-9]+/){
    $self->[$index];
  }else{
   die "please set index number.\n"; 
  }
}

# セッター
sub set_data {
  my $self   = shift;
  my $index  = shift || 0;
  if($index =~ /[0-9]+/){
    my ($elm) = shift || $self->[$index];
    $self->[$index] = $elm;
  }else{
   die "please set index number.\n"; 
  }
}

package main;

my $obj = SomeClass->new;

# ゲット データ
print $obj->get_data(1), "\n";

# セット/ゲット データ
$obj->set_data(3, 'new_data');
print $obj->get_data(3), "\n";

# ゲット アトリビュート
print $obj->get_attrs. "\n";

print "---\n";

print $obj->[0], "\n";


