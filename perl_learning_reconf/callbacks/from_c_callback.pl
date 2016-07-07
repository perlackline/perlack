#!/usr/bin/perl

use strict;
use warnings;

# from C

# 呼び出し側のファンクション
# パラメータとしてコールバックをひとつ取る
sub PrintTwoNumbers {
  my $sub = shift;
  printf "%d and %d\n", $sub->(),$sub->();
}

# コールバック可能
my $overNineThousand = sub {
  return (int(rand(1_000_000)) % 1000) + 9001;
};
# 他のコールバック可能
my $meaningOfLife = sub {
  return 42;
};

# ここで PrintTwoNumbers() をコールする
# 引数は異なる 3 つのコールバック
PrintTwoNumbers(sub{rand(1_000_000)});
PrintTwoNumbers($overNineThousand);
PrintTwoNumbers($meaningOfLife);


