#!/usr/bin/perl
# ディレクトリ操作
use strict;
use warnings;

#chdir '..' or die "cannot chdir to /etc: $!";
chdir 'files' or die "cannot chdir to /etc: $!";
#chdir or die "cannot chdir to /etc: $!";

print "-- All files --\n";
print map { "$_\n" }  glob ".* *";

print "-- Any character after 't' --\n";
print map { "$_\n"}  glob 't?est.txt';

print "-- Any numeric one digit after 'test' --\n";
print map { "$_\n" }  glob 'test[0-9, ab].txt';

print "-- Either 'one', 'two' or 'three' after 'test_' ---\n";
print map { "$_\n"} glob 'test_{one,two,three}*';

print "-- Either 'a' or 'b' after 'test_' --\n";
print map { "$_\n" }  glob 'test_[ab]*';

print "-- Home dir --\n";
print map { "$_\n" } glob '~/* ~/.*';

