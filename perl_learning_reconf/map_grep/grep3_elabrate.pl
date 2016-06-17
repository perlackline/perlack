#!/usr/bin/perl

use strict;
use warnings;

# 配列のハッシュを持ったハッシュ
my %provisions = (
  'Bellri'  => [qw(bule_shirt hat jacket preserver sunscreen)],
  'Aida'    => [qw(sunscreen water_bottle slide_rule radio)],
  'Raraiya' => [qw(red_shirt hat lucky_socks water_bottle)],
);

foreach my $person (keys %provisions){
    print "$person:\n";
    print join ', ', @{$provisions{$person}}, "\n";
}
 

print "\n---\n";

# 持ち物が 5 個未満
my @packed_light = grep @{ $provisions{$_} } < 5, keys %provisions;
# Raraiya Aida
print "$_\n" for @packed_light;

print "\n---\n";

# water_bottle を持っている
my @all_wet = grep{
  grep $_ eq 'water_bottle', @{$provisions{$_}};
} keys %provisions;
# Raraiya Aida
print "$_\n" for @all_wet;

print "\n---\n";

# ハッシュを配列リファレンスの配列に変換
my @remapped_list = map{
  # 人物 => アイテムリストの配列レフの配列レフ
  [ $_ => $provisions{$_} ];
} keys %provisions;
#Raraiya:
#red_shirt,hat,lucky_socks,water_bottle,
#Bellri:
#bule_shirt,hat,jacket,preserver,sunscreen,
#Aida:
#sunscreen,water_bottle,slide_rule,radio,
#print map{ + "$_->[0]:\n", join ',', @{$_->[1]}, "\n" } @remapped_list;
foreach my $ary_ref ( @remapped_list ){
  print "$ary_ref->[0]: ", join ',', @{$ary_ref->[1]}, "\n";
}
print "\n---\n";

# 名前と持ち物を 1 つずつ
my @person_item_pairs = map{
  my $person = $_;
  my @items = @{ $provisions{$_} };
  map [$person => $_], @items;
} keys %provisions;

print map{ "$_->[0] : $_->[1]\n" } @person_item_pairs;

