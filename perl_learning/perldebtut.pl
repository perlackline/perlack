#!/usr/bin/perl
use strict;

# http://perldoc.jp/docs/perl/5.10.0/perldebtut.pod
# $B%G%P%C%,(B example code 1.

my $key = 'welcome';
my %data = (
    'this' => qw(that),
    'tom' => qw(and jerry),
    'welcome' => q(Hello World),
    'zip' => q(welcome),
);
my @data = keys %data;

print "All OK\n" if grep($key, keys %data);
print "$data{$key}\n";
print "done: '$data{$key}'\n";
exit;
