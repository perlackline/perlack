#!/usr/bin/perl
# テスト
use strict;
use warnings;

print "a" | "b", "\n";
print "b" | "c", "\n";
print "c" | "d", "\n";
print "d" | "e", "\n";

print "\xAA" | "\x55", "\n";
printf "%x\n", "\x11" | "\x22";

print "--bit string--\n";

print "j p \n" ^ " a h";
print "JA" | "  ph\n";
print "japh\nJunk" & "_____";
print 'p N$' ^ " E<H\n";

print "--bit string explicitly--\n";

print 150 | 105, "\n";
print '150' | 105, "\n";
print '150' | '105', "\n";

print 0+150 | 0+105, "\n";
print "150" | "105", "\n";

my $foo = 150;
my $bar = 105;

print "--bit string explicitly--\n";

print 0+$foo | 0+$bar, "\n";
#print '$foo' | '$bar', "\n";
print "$foo" | "$bar", "\n";

