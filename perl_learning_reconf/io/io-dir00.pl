#!/usr/bin/perl

use strict;
use warnings;

use IO::Dir;

#tie my %dir, 'IO::Dir', "io-dirs";
# 第 3 引数でDIR_UNLINK を ON
tie my %dir, 'IO::Dir', "io-dirs", 1;

print "---\n";
print "$_:\n", "-- ", $dir{$_}, "\n" for keys %dir;
print "---\n";

$dir{add} = 2;

print "add:\n", "-- ",$dir{add}, "\n";

#delete $dir{add};
print "---\n";
delete $dir{add};
