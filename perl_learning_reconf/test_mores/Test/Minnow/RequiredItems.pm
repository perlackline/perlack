#!/usr/bin/perl

package Test::Minnow::RequiredItems;
use strict;

use base qw(Exporter);
use vars qw(@EXPORT $VERSION);

use Test::Builder;

my $Test = Test::Builder->new();

$VERSION = '0.10';
@EXPORT  = qw(check_required_items_ok);

sub check_required_items_ok {
  my $who   = shift;
  my $items = shift;

  my @required = qw(preserver sunscreen water_bottle jacket);
  my @missing = ();

  for my $item (@required) {
    unless (grep $item eq $_, @$items) { # 何か持っていないものは ?
      push @missing, $item;
    }
  }

  if (@missing) {
    $Test->diag( "$who needs @missing.\n" );
    $Test->ok(0);
  }else{
    $Test->ok(1);
  }
}
1;

