#!/usr/bin/perl

package Oogaboogoo::date2;
use strict;
use Exporter;
our @ISA = qw(Exporter);
our @EXPORT = qw(day mon);
# $B%(%/%9%]!<%H%?%0$N$?$a$N%3!<%I$rDI2C(B
# @EXPORT $B$X$N%j%U%!%l%s%9$rD>@\;H$C$F$$$k!#(B
our %EXPORT_TAGS = ( all => \@EXPORT );
# $B0J2<$G$b%(%/%9%]!<%H%?%0$r@_Dj2DG=(B
# $B?7$7$$%3%T!<$r;H$C$F(B 2 $B$D$,;2>H$7$J$$J}K!!#(B
# our %EXPORT_TAGS = ( all => [ @EXPORT ] );

my @day = qw(ark dip wap sen pop sep kir);
my @mon = qw(diz pod bod rod sip wax lin sen kun fiz nap dep);

sub day {
  my $num = shift @_;
  die "$num is not a valid day number"
    unless $num >= 0 and $num <= 6;
  $day[$num];
}

sub mon {
  my $num = shift @_;
  die "$num is not a valid month number"
    unless $num >= 0 and $num <= 11;
  $mon[$num];
}

1;

