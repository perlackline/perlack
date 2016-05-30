#!/usr/bin/perl

#use strict;
#use warnings;

########
# sorting and filtering hash keys
########
# ソートとフィルタリング ハッシュキーの

use Data::Dumper;

$Data::Dumper::Sortkeys = \&my_filter;

# ord() は最初の文字のインデクス値を返す
my $foo = { map { (ord, "$_$_$_") } 'I'..'Q' };
my $bar = { %$foo };
my $baz = { reverse %$foo };

print Dumper [ $foo, $bar, $baz ];

sub my_filter {
  my ($hash) = @_;
  # return an array ref containg the hash keys to dump
  # in the order that you want them to be dumped
  return [
    # Sort the keys of %$foo in reverse numeric order
      $hash eq $foo ? (sort {$b <=> $a} keys %$hash) :
    # Only dump the odd number keys of %$bar
      $hash eq $bar ? (grep {$_ % 2} keys %$hash) :
    # Sort keys in default order for all other hashes
      (sort keys %$hash)
  ];
}

