#!/usr/bin/perl
use strict;
use warnings;

#use Time::Piece;

# リストコンテキスト
my @ltime = localtime;
print "list   : ", map { "$_ " } @ltime, "\n";
# スカラコンテキスト
my $ltime = localtime;
print "scalar : $ltime\n";

#my $t = localtime;
#print "Time is $t\n";
#
#print "Time is ", $t->year, "\n";
#print "Time is ", $t->month, "\n";
#print "Time is ", $t->day, "\n";
#
#print "ymd() ", $t->ymd, "\n";
#print "epoch() ", $t->epoch, "\n";
