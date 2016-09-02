#!/usr/bin/perl

use strict;
use warnings;

use IO::Dir;
#use IO::Dir qw(DIR_UNLINK);

#tie my %dir, 'IO::Dir', "io-dirs";
# 第 3 引数でDIR_UNLINK を ON
tie my %dir, 'IO::Dir', "io-dirs", 1;
#tie my %dir, 'IO::Dir', "io-dirs", DIR_UNLINK;

print "---\n";
print "$_:\n", "-- ", $dir{$_}, "\n" for keys %dir;
print "---\n";

#$dir{add} = `date +%s -d '2010-10-01'`;
$dir{add} = time;
$dir{add2} = -1000000; 

print "add:\n", "-- ",$dir{add}, "\n";

#delete $dir{add};
print "---\n";
print "date: ", `date +%s -d '2010-10-01'`;
print "time: ", time, "\n";
delete $dir{add};


