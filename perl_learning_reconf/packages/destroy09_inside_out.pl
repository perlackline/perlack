#!/usr/bin/perl

use strict;
use warnings;

# check destroy
# inside-out object

package SomeClass;

sub new {
  my $class = shift;
  my $attr = { data1 => 'val1', data2 => 'val2' };
  bless $attr, $class;
}

# ゲッター
sub get_attrs {
  my $self = shift;
  my @keys = ();
  foreach my $key ( keys %{$self} ){
    push @keys, $key;
  }
  "@keys";
}

# ゲッター
sub get_data {
  my $self  = shift;
  my ($key) = @_ or die "please set data keys.\n"; 
  $self->{$key};
}

# セッター
sub set_data {
  my $self   = shift;
  my $key    = shift || 'data1';
  my ($data) = shift || $self->{$key};
  $self->{$key} = $data;
}

package main;

my $obj = SomeClass->new;

# ゲット データ
print $obj->get_data('data1'), "\n";

# セット/ゲット データ
$obj->set_data('data2', 'new_val');
print $obj->get_data('data2'), "\n";

# セット/ゲット データ
$obj->set_data('data3', 'val3');
print $obj->get_data('data3'), "\n";

# ゲット アトリビュート
print $obj->get_attrs. "\n";

print "---\n";

print $obj->{data1}, "\n";


