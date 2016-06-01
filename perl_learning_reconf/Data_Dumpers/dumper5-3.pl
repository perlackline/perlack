#!/usr/bin/perl

#use strict;
#use warnings;

########
# sorting and filtering hash keys
########
# ソートとフィルタリング ハッシュキーの

use Data::Dumper;
#$Data::Dumper::Sortkeys = \&my_filter;

my $foo = { map { (ord, "$_$_$_") } 'I'..'Q' };
my $bar = { %$foo };
my $baz = { reverse %$foo };
my $qux = { reverse %$foo };

print "\$foo: $foo\n";
print "\$bar: $bar\n";
print "\$baz: $baz\n";

#my $d = Data::Dumper->new([$foo,$bar,$baz]);
#my $d = Data::Dumper->new([$foo,$bar,$baz,$qux]);
my $d = Data::Dumper->new([$foo,$bar]);
$d->Sortkeys([\%my_filter]);
print $d->Dump;
#print $d->Dump([$foo,$bar,$baz]);
#print Dumper [ $foo, $bar, $baz ];

sub my_filter {
  my ($hash) = @_;
  return [
    $hash eq $foo ? (sort {$b <=> $a} keys %$hash) :
    $hash eq $bar ? (grep {$_ % 2} keys %$hash) :
    (sort keys %$hash)
  ];
}

