#!/usr/bin/perl

use strict;
use warnings;

# check destroy
# inside-out object

use Data::Dumper;

package InsideOut;

use Data::Dumper;

# InsideOut $B$KJD$89~$a$i$l$?%O%C%7%e(B
my %objects;

# $B%3%s%9%H%i%/%?(B
sub new {
  my $class = shift;

  # $B%"%H%j%S%e!<%H$OE,Ev$J%9%+%i%j%U%!%l%s%9(B
  bless \eval{ my $scalar }, $class;
}

# $B%G%9%H%i%/%?(B
sub DESTROY {
  my $self = shift;

  warn "deleting ", $objects{$self+0};
#
#  print "deleting ", $objects{$self+0}, "\n";
#  print Data::Dumper->Dump( [\%objects],[ '*objects' ]);
#  # $BJD$89~$a$i$l$?%O%C%7%e%(%s%H%j$r:o=|(B
  delete $objects{$self+0};
}

# $B%"%/%;%5(B
sub name {
  my $self = shift;
  $objects{$self+0}{name} = shift if @_;
  $objects{$self+0}{name};
}
# $B%"%/%;%5(B
sub uri {
  my $self = shift;
  $objects{$self+0}{uri} = shift if @_;
  $objects{$self+0}{uri};
}


package main;


my $obj = InsideOut->new;
$obj->name("Sela");
$obj->uri("http://pointoht.ti-da.net");


print $obj->name, ", ", $obj->uri, "\n";

print "---\n";
print Data::Dumper->Dump([$obj],[qw(*obj)]);


