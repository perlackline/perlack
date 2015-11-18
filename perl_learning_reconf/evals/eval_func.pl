#!/usr/bin/perl

use strict;
use warnings;

my $code;
foreach my $name ('foo', 'bar') {
  $code .= qq/sub $name { print "this is $name\n"}/;
}

#foo();
#bar();

eval $code;

foo();
bar();

