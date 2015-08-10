#!/usr/bin/perl

use strict;
use warnings;

my $now = time;
my $yesterday = $now - 24 * 60 * 60;
print "now: $now\n";
print "yesterday: $yesterday\n";

use  Time::Local 'timelocal';

my $any_date = '2010/10/10 10:10:10';

my ($date, $time) = split ' ', $any_date;
my ($year, $month, $day) = split '/', $date;
my ($hour, $min, $sec)   = split ':', $time;


my $any_epoch = timelocal($sec, $min, $hour, $day, $month - 1, $year - 1900); 

print "any epoch: $any_epoch\n";

