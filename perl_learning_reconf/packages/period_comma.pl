#!/usr/bin/perl

use strict;
use warnings;

# chacking period and comma

package Context;

sub new {
  my $class = shift;
  #my %default = ( key1 => 'val1', key2 => 'val2' );
  my $val = 'val1';
  my @ary = qw(one two three);
  bless { scalar => $val, ary => [ @ary ] }, $class;
}

sub accessor {
  my $self = shift;
  my $key = shift or die "please set one or two args: $!";
  my $val = shift;

  if ( $key eq 'ary' ){
    @{ $self->{$key} } = @{ $val } if $val;
    #join ' ', @{ $self->{$key} };
    #foreach (@{ $self->{$key} }){
    #  print $_;
    #}
    map { $_ } @{ $self->{$key} };
  }elsif( $key eq 'scalar' ){
    $self->{$key} = $val if $val;
    $self->{$key};
  }else{
    die "plese set 'scalar' or 'ary' as args: $!";
  }
}

package main;

my $obj = Context->new;

use Data::Dumper;
print Dumper $obj;

print "---\n";

print $obj->accessor('ary'). "\n";
print $obj->accessor('ary'), "\n";

