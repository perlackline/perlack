#!/usr/bin/perl
use strict;
use warnings;

#use Time::Piece;

# リストコンテキスト (生)
my @ltime = localtime;
print  "list_raw :", map { " $_" } @ltime, "\n";

# リストコンテキスト (分割)
my ($sec, $min, $hour, $mday,
    $mon, $year, $wday, $yday, $isdst) = localtime;

# 値の設定
$year += 1900;
my @mos = qw( Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec );
my @dow = qw( Sun Mon Tue Wed Thu Fri Sat );

# 整形出力
printf "list     : %s %s  %d %02d:%02d:%02d %d\n",
        $dow[$wday], $mos[$mon], $mday,
	$hour, $min, $sec, $year;

# スカラコンテキスト
my $ltime = localtime;
print   "scalar   : $ltime\n";

#my $t = localtime;
#print "Time is $t\n";
#
#print "Time is ", $t->year, "\n";
#print "Time is ", $t->month, "\n";
#print "Time is ", $t->day, "\n";
#
#print "ymd() ", $t->ymd, "\n";
#print "epoch() ", $t->epoch, "\n";
