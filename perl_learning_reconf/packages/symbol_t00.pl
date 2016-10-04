#!/usr/bin/perl

#use strict;
use warnings;

#our $foo = 'this is scalar';
#our @foo    = qw(1 2 3 4 5 6);
#our %foo   = qw(key1 val1 key2 val2);

$foo = 'this is scalar';
@foo    = qw(1 2 3 4 5 6);
%foo   = qw(key1 val1 key2 val2);

#use Data::Dumper;
#print Dumper (\%main::), "\n";
#print grep {
#  /'foo'/;
#} Data::Dumper->Dump([\%main::],[qw( *main:: )]),"\n";
print "---\n";
#print grep { /foo/ } map {
#  "[key] $_ [value] $main::{$_}\n";
#} keys %main::; 

print ${*main::foo},"\n";
print $main::foo,"\n";
print @{*main::foo},"\n";
print %{*main::foo},"\n";
print ${*main::0},"\n";

print "---\n";
print \$main::foo,"\n";
print \@main::foo,"\n";
print \%main::foo,"\n";
print \$main::0,"\n";
#
#print "---\n";
#print ${*foo{SCALAR}},"\n";
#print @{*foo{ARRAY}},"\n";
#print %{*foo{HASH}},"\n";
#print ${*0{SCALAR}},"\n";

print "---bar---\n";
#local *main::bar = *main::0;
*main::bar = *main::foo;

print \$main::bar,"\n";
print $main::bar,"\n";
print \@main::bar,"\n";
print \%main::bar,"\n";
print \$main::0,"\n";

print "--- *main::foo and *main::bar ---\n";

print *main::foo, "\n";
print *main::bar, "\n";

#print "$bar\n";
#print "$_ " for @bar;
#print "\n";
#print "$_ : $bar{$_} " for sort keys %bar;
#print "\n";
#print *main::foo, "\n";
#print *main::bar, "\n";

