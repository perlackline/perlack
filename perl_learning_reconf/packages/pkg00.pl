#!/usr/bin/perl

use strict;
use warnings;

my $owner = 'www';

# 古いパッケージセパレータ ' により
# Name "owner::s" used only once: possible typo
# のエラーが発生する
print "this is ${owner}'s house\n";
#print "this is $owner\'s house\n";
#print "this is $owner's house\n";
