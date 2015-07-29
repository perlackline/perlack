#!/usr/bin/perl
use warnings;
use strict;

my $pre = 0;
my $suf = 0;

for (1..3) {
    ++$pre;
    $suf++;
    print "in loop\n";
}

print "Its finish.\n";
exit;
