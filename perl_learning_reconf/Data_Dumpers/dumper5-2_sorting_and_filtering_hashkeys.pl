#!/usr/bin/perl

#use strict;
#use warnings;

########
# sorting and filtering hash keys
########
# ソートとフィルタリング ハッシュキーの

use Data::Dumper;

#$Data::Dumper::Sortkeys = \&my_filter;
my $foo = { map { (ord, "$_$_$_") } 'I'..'K' };
my $bar = { %$foo };
my $baz = { reverse %$foo };
my $qux = { map { (ord, "$_$_$_") } 'a'..'d' };

my $d = Data::Dumper->new([$foo,$bar,$baz,$qux],[qw(foo bar baz qux)]);
#my $d = Data::Dumper->new([$foo, $bar, $baz, $qux]);
#my $d_foo = Data::Dumper->new([$foo]);
#my $d_bar = Data::Dumper->new([$bar]);
#my $d_baz = Data::Dumper->new([$baz]);
$d->Sortkeys(\&my_filter);

print "---\n";
#print Dumper [$foo, $bar, $baz ];
print $d->Dump;
#print $d_foo->Dump;
#print $d_bar->Dump;
#print $d_baz->Dump;

sub my_filter {
  my ($hash) = @_;
  return [
    $hash eq $foo ? (sort {$b <=> $a} keys %$hash) :
    $hash eq $bar ? (grep { $_ % 2 } keys %$hash) :
    (sort keys %$hash)
  ];
}

