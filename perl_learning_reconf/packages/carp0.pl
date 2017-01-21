#!/usr/bin/perl

use strict;
use warnings;

#use Carp;

package SomeClass;
#use Carp qw(cluck);
use Carp;

sub new {
  my $class = shift;
  bless {};
}
sub warn_me{ warn( $_[1]) }
sub carp_me{ carp( $_[1]) }
#sub cluck_me{ Carp::cluck( $_[1]) }
sub confess_me{ confess( $_[1]) }

package main;

my $obj = SomeClass->new;

$obj->warn_me( "Hey!");
$obj->carp_me( "You!");
#$obj->cluck_me( "me!?");
$obj->confess_me( "me!?");
