#!/usr/bin/perl

use strict;
#use Oogaboogoo::date2 qw(day mon);
# all $B%(%/%9%]!<%H%?%0$r;H$&(B
use Oogaboogoo::date2 qw(:all);

my($sec, $min, $hour, $mday, $mon, $year, $wday) = localtime;
my $day_name = day($wday);
my $mon_name = mon($mon);
$year += 1900;
print "Today is $day_name, $mon_name $mday, $year.\n";

