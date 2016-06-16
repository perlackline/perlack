#!/usr/bin/perl

use strict;
use warnings;

# http://www.chikkun.com/und/document/perl/variables.html#l10

# アルファベットを準備
my @records = ('a'..'z', 'A'..'Z');

my %hash;
foreach(0..1000){

  my $val;
  foreach(0..10){
    # 適当なアルファベット列 (11桁) を取得
    $val .= $records[ int(rand(51)) ];
  }

  # ハッシュ生成
  $hash{$_} = $val;
}

sub getval {
  my $key = shift;
  return $hash{$key};
}

my @array = (0..1000);

my $normal = sub{
  my @sorted = sort{ getval($a) cmp getval($b) } @array;
};

my $orcish = sub{
  my %getval;
  my @sorted = sort {
      ($getval{$a} ||= getval($a))
      cmp
      ($getval{$b} ||= getval($b))
  } @array;
};

my $schwartz = sub{
  my @sorted = map $_->[0],
               sort{$a->[1] cmp $b->[1]}
               map [$_, getval($_)], @array;
};

use Benchmark;
my $count = -5;
timethese $count, {
  normal   => $normal,
  orcish   => $orcish,
  schwartz => $schwartz,
};

#foreach my $key (@sorted){
#  print "$key: $hash{$key}\n";
#}

#use Data::Dumper;
#print Dumper \@sorted;
#print Dumper \%hash;
