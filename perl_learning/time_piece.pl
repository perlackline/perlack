#!/usr/bin/perl
use strict;
use warnings;
use utf8;
use Encode;

use Time::Piece;

# 曜日名のリストを作成
my @days = qw/ 日 月 火 水 木 金 土 /;

#my @months = ( '睦月', '如月', '弥生', '卯月', '皐月', '水無月',
#               '文月', '葉月', '長月', '神無月', '霜月', '師走' );

my $uduki = '卯月';

#my @months = qw/ 睦月 如月 弥生 卯月 皐月 水無月
#               文月 葉月 長月 神無月 霜月 師走 /;
my @months = qw/ 睦月 如月 弥生
                 $uduki 皐月 水無月
                 文月 葉月 長月
                 神無月 霜月 師走 /;

my $comma = ',';

Time::Piece::day_list(@days);
Time::Piece::mon_list(@months);

printf "day: %s\n", localtime->day();
printf "mon: %s\n", localtime->month();

#my $ja_day = localtime->day(@days);
#print "ja_day:  $ja_day\n";
#
#my $t = localtime;
#printf "ja_day2: %s\n", $t->day(@days);

#printf "jp_mon: %s\n", $t->month();
