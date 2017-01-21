#!/usr/bin/perl

use strict;
use warnings;

# check AUTOLOAD

package SomeClass;
sub new {
  my $class = shift;
  my $name = shift || 'Tarou';
  my $self = { Name => $name };
  bless $self, $class;
}

#sub name {
#  my $self = shift;
#  $self->{Name} = shift if @_;
#  $self->{Name};
#}

sub AUTOLOAD {
  use Carp qw(croak);
  our $AUTOLOAD;
  (my $method = $AUTOLOAD) =~ s/.*:://s;
  if ( $method eq 'name' ){
    eval 'sub name {
        my $self = shift;
        $self->{Name} = shift if @_;
        $self->{Name};
      }';
    die $@ if $@;
    goto &name;
  }else{
    my $class = shift;
    #croak "$class does not know how to $method\n";
    warn ref($class), "does not know how to $method\n";
  }
} 
sub DESTROY {};

package main;


my $obj = SomeClass->new;
print "1: ", $obj->name, "\n";

$obj->name('Jirou');
print "2: ", $obj->name, "\n";

