#!/usr/bin/perl

use strict;
use warnings;

use List::Util qw(first max maxstr min minstr reduce shuffle sum);

my @list = qw/one two three/;

my $value;
my $code = sub { defined };
my $foo = reduce{ defined($a) ? $a:
                  $code->(local $_ = $b) ? $b: undef } undef, undef, @list;

#my $foo = reduce{ $a > $b ? $a : $b } 1..10;
print "$foo\n";

