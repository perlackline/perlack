#!/usr/bin/perl
# ディレクトリ操作
use strict;
use warnings;

#chdir '..' or die "cannot chdir to /etc: $!";
chdir 'files' or die "cannot chdir to /etc: $!";
#chdir or die "cannot chdir to /etc: $!";

my $foo = '../';
print "-- All files --\n";
#print map { "$_\n" }  glob ".* *";
#print map { "nulfh: $_\n" }  <.* *>;
#print map { "decomp: $_\n" }  <$foo.* $foo*>;
print map { "decomp; $_\n" }  glob "$foo.* $foo*";

my $t = 't';
print "-- Any character after 't' --\n";
#print map { "$_\n"}  glob 't?est.txt';
#print map { "nulfh: $_\n"}  <t?est.txt>;
print map { "decomp: $_\n"}  <$t?est.txt>;

my $test = 'test';
print "-- Any numeric one digit after 'test' --\n";
#print map { "$_\n" }  'test[0-9,ab].txt';
#print map { "nulfh: $_\n" }  <test[0-9,ab].txt>;
# If valiable name is not enclosed in { }, error occurs.
#print map { "decomp: $_\n" }  glob "${test}[0-9].txt";
print map { "decomp: $_\n" }  <${test}[0-9,ab].txt>;

print "-- Either 'one', 'two' or 'three' after 'test_' ---\n";
#print map { "$_\n"} glob 'test_{one,two,three}*';
#print map { "nulfh: $_\n"} <test_{one,two,three}*>;
# If valiable name is not enclosed in { }, error occurs.
print map { "decomp: $_\n"} <${test}_{one,two,three}*>;

print "-- Either 'a' or 'b' after 'test_' --\n";
#print map { "$_\n" }  glob 'test_[ab]*';
print map { "nulfh: $_\n" } <test_[ab]*>;

print "-- Home dir --\n";
#print map { "$_\n" } glob '~/* ~/.*';
print map { "nulfh: $_\n" } <~/* ~/.*>;

