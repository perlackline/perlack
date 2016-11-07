##!/usr/bin/perl

print "outer print\n";
CHECK { print "outer CHECK\n"}

1;
