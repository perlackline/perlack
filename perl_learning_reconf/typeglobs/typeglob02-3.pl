#!/usr/bin/perl

use strict;
use warnings;

our $foo = 'foo';
our @foo = qw/foo Foo FOO/;
our %foo = (0 => 'main', 1 => 'foo', 2 => 'hash');

our $bar;
our @bar;
our %bar;

#*bar = *foo;
*bar = \$foo;

print "bar\$: $bar\n";
print "bar\@: @bar\n";
print "bar\%: ";
map { print "$_ : $bar{$_}, " } sort keys %bar;
print "\n";

$bar = 'bar!!';

print "foo\$:$foo\n";

print *foo{SCALAR}, "\n";
print \$foo, "\n";
print \$bar, "\n";


