#!/usr/bin/perl

#use strict;
#use warnings;

use Data::Dumper;

package Foo;
sub new{ bless{ 'a'=>1,'b'=>sub{ return "foo" }}, $_[0]};

package Fuz;
sub new{ bless \($_ = \ 'fuz\'z'), $_[0]};

package main;
$foo = Foo->new;
$fuz = Fuz->new;
$boo = [
  1,[],"abcd",\*foo,{1=>'a',023=>'b',0x45=>'c'},\\"p\q\'r",$foo,$fuz
  ];

######## 
# simple usage
######## 

#$bar = eval(Dumper($boo));
#print($@) if $@;
## pretty print (no array indices)
#print Dumper($boo), Dumper($bar);

## don't output name where feasible
#$Data::Dumper::Terse = 1;
## turn off all pretty print 
#$Data::Dumper::Indent = 0;
#print Dumper($boo), "\n";

## mild pretty print
#$Data::Dumper::Indent = 1;
#print Dumper($boo);

## pretty print with array indices
#$Data::Dumper::Indent = 3;
#print Dumper($boo);

## print strings is double quotes
$Data::Dumper::Useqq = 1;
print Dumper($boo);

# specify hash key/value separator
#$Data::Dumper::Pair = " : ";
#print Dumper($boo);

