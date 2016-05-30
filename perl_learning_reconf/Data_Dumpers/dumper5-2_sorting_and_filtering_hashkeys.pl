#!/usr/bin/perl

#use strict;
#use warnings;

########
# sorting and filtering hash keys
########
# ソートとフィルタリング ハッシュキーの

use Data::Dumper;

#$Data::Dumper::Sortkeys = \&my_filter;
#my $foo = { map { ord, "$_" } 'I'..'Q' };
#my $foo = { map { (ord, "$_") } 'I'..'Q' };
my $foo = { map { (ord, "$_$_$_") } 'I'..'Q' };
my $bar = { %$foo };
my $baz = { reverse %$foo };

my $d = Data::Dumper->new([$foo, $bar, $baz]);
$d->Sortkeys([\&my_filter]);

print "---\n";
#print "key:$_ => val:$$foo{$_}\n" for keys %$foo;
print "---\n";
print Dumper [$foo, $bar, $baz ];

sub my_filter {
  my ($hash) = @_;
  return [
    $hash eq $foo ? (sort {$a <=> $b} keys %$hash) :
    #$hash eq $foo ? (sort {$b <=> $a} keys %$hash) :
    $hash eq $bar ? (grep { $_ % 2 } keys %$hash) :
    (sort keys %$hash)
  ];
}
