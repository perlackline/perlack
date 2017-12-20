#!/usr/bin/perl

use strict;
use warnings;

my @hoge = qw/hoge fuga/;
my @foo  = qw/ foo bar baz/;

sub output {
  print "ref: $_[0], $_[1]\n";
  my (@array1, @array2) = @_;
  print '@array1 = '. join(',', @array1)."\n";
  print '@array2 = '. join(',', @array2)."\n";
}

print '-- output(@hoge, @foo)'."\n";
output(@hoge,@foo);
# result:
# @array1 = hoge,fuga,foo,bar,baz
# @array2 =

sub output2 {
  print "ref: $_[0], $_[1]\n";
  # array ref を処理する
  my ($array1, $array2) = @_;
  print '@$array1 = '. join(',', @$array1)."\n";
  print '@$array2 = '. join(',', @$array2)."\n";
}

print '-- output2(\@hoge, \@foo)'."\n";
output2(\@hoge,\@foo);
# result:
# @$array1 = hoge,fuga
# @$array2 = foo,bar,baz

print '-- output3(@hoge, @foo)'."\n";

print \$_. " : ". "$_\n" for @hoge,@foo;
print "-----\n";

output3(@hoge,@foo);
sub output3 {
  print \$_. " : ". "$_\n" for @_;
}

print '-- output4(\@hoge, \@foo)'."\n";

use Data::Dumper;
my %hash = (key1 => 'val1', key2 => 'val2');
my @arry = (qw/elm1 elm2 elm3/);

output4(\%hash, \@arry);
sub output4 {
  print Dumper \@_;
}

print "\n-- output5()\n";

use Data::Dumper;

output5(@arry);
sub output5 {
  @_ = map { $_ = $_ . '_map1' } @_;
  $_[0] = map { $_ = $_ . '_map1' } @_;
  @_ = grep { s/(\w+)/$1_grep1/ } @_;
  @_ = map { $_ = $_ . '_map2' } @_;
  print "$_\n" for @_;
  print Dumper \@_;
}

print "$_\n" for @arry;



