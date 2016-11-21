#!/usr/bin/perl

use strict;
use warnings;

package Klass;
my %attr = ( attr1 => 'val1', attr2 => 'val2' ); 
sub new { 
  my $class = shift;
  bless { %attr, @_ }, $class;
}

sub attr1 {
  my $self = shift;
  $self->{attr1} = shift if @_;
  $self->{attr1};
}
sub attr2 {
  my $self = shift;
  $self->{attr2} = shift if @_;
  $self->{attr2};
}



package main;

my $obj = Klass->new;

# 2 つのアトリビュートの値を任意にセット
$obj->attr1('new_val1');
$obj->attr2('new_val2');

# 値をゲット
my $attr1 = $obj->attr1;
my $attr2 = $obj->attr2;

print "attr1: $attr1\n";
print "attr2: $attr2\n";

use Data::Dumper;
print Dumper $obj;

