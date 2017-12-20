#!/usr/bin/perl

package Foo;
our $VERSION = "1.7043";

package Bar;
#our $VERSION = "v0.010.0"; 
use version; our $VERSION = version->declare('v1.704.300');

package main;

use strict;
use warnings;

use version;

my $v_foo = $Foo::VERSION;
my $v_bar = $Bar::VERSION;

print $v_foo, "\n";
print $v_bar, "\n";
#if ($v_foo == $v_bar){ print "yes\n" }
if (version->parse($v_foo) == version->parse($v_bar)){
  print "yes\n"
}else{
  print "no match\n";
}
print "---\n";

print version->parse($v_foo)->normal, "\n";

print version->parse('0.01')->normal, "\n";
print version->parse('v0.10.0')->numify, "\n";
