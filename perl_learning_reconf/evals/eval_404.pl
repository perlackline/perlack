#!/usr/bin/perl

use strict;
use warnings;
use Benchmark qw/timethese cmpthese/;

cmpthese(
  timethese(
    0,
    {
      eval => sub {
          no warnings 'redefine'; # comment this out leter
          my $src = 'sub add{ $_[0] + $_[1] }';
          eval $src;
          add( 1, 1 ) == 2 or die;
      },
      subref => sub {
          my $add = sub { $_[0] + $_[1] };
          $add->( 1, 1 ) == 2 or die;
      }
    }
  )
);

