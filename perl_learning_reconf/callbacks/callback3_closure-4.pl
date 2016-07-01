#!/usr/bin/perl

use strict;
use warnings;

use File::Find;

sub create_find_callbacks_that_sum_the_size {
  my $total_size = 0;
  return (sub{$total_size += -s if -f},sub{return $total_size});
}

# サブルーチンをセットアップ
my %subs;
foreach my $dir (qw(bin lib man)){

  # autovivification ?

  #my($callback, $getter) = create_find_callbacks_that_sum_the_size();
  #$subs{$dir}{CALLBACK}  = $callback;
  #$subs{$dir}{GETTER}    = $getter;
  ($subs{$dir}{CALLBACK}, $subs{$dir}{GETTER})
    = create_find_callbacks_that_sum_the_size();
  
}

# データ収集
for (keys %subs){
  find($subs{$_}{CALLBACK}, $_);
}

# データの表示
for (sort keys %subs){
  my $sum = $subs{$_}{GETTER}->();
  print "$_ has $sum bytes\n";
}

