#!/usr/bin/perl

use strict;
use warnings;

#my %provisions = (
#  'Bellri'  => [qw(bule_shirt hat jacket preserver sunscreen)],
#  'Aida'    => [qw(sunscreen water_bottle slide_rule radio)],
#  'Raraiya' => [qw(red_shirt hat lucky_socks water_bottle)],
#);

# 数字の桁を足して奇数になる要素が *存在するか* を
# チェック = index 値のチェックで OK

# 数字リスト
my $numbers = [ qw(1 2 4 8 16 32 64) ];


# 6. grep からの戻り値は index 値 0,4,5
my @indices_of_odd_digit_sums = grep{

  # 2. index 値 $_ で要素をコピー 
  my $number = $$numbers[$_];

  # 3. 数字の桁を分割して順次加算
  my $sum;
  $sum += $_ for split //, $number;

  # 4. 剰余がある場合に 真(1) 剰余がない場合に 偽(0)
  $sum % 2;

  # 5. grep は 剰余がある ** $_ (index 値) ** を返す

} 0.. $#$numbers; # 1. index 値を grep に渡す

foreach my $elm (@indices_of_odd_digit_sums){
  # 0 4 5
  print "$elm\n";
}

print "---\n";
# ---------------------------------
# index 値を配列スライスで指定して要素をコピーすれば
# 対象の要素のリストがすぐに作成出来る。
my @odd_digit_sums = @{$numbers}[ @indices_of_odd_digit_sums ];

foreach my $elm (@odd_digit_sums){
  # 1 16 32
  print "$elm\n";
}

