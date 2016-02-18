#!/usr/bin/perl

use strict;
use warnings;

my @ary = (1, 2, 3);

print "before: @ary\n";

#@ary = sub_routine(@ary);
$ary[$#ary+1] = sub_routine(@ary);

print "after : @ary\n";

sub sub_routine {
  my $add_value = 'add';
  #push @_, $add_value;
  #return @_;
  #@_;
  $add_value;
}
