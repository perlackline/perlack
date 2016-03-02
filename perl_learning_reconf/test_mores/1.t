#!/usr/bin/perl

use strict;
use warnings;

use Test::More 'no_plan';

BEGIN{ use_ok( 'My::List::Util' ) }

# # # # # # 総和 (sum)
ok(defined &sum, 'The sum() routine exists');
is(sum(2,2  ), 4, '2 + 2 = 4'    );
is(sum(2,2,3), 7, '2 + 2 + 3 = 7');
is(sum( ),     0, 'null sum is 0');
is(sum(-1),   -1, '-1 = -1'      );
is(sum(-1, 1), 0, '-1 + 1 = 0'   );
is(sum('Ginger', 5),
      5, 'A string + 5 = 5');
is(sum(qw(Ginger Mary-Ann)),
      0, 'Two strings give 0');

# # # # # # シャッフル (shuffle)
ok(defined &shuffle, "The shuffle() routine exists");

#my $array = [qw( a b c d e f )];
# 配列リファレンスだとテストの比較が成り立たないため配列に変更
my @array = qw( a b c d e f );

#my $shuffled = $array;
# $array の変更と同じ理由で配列に変更
my @shuffled = @array;

#shuffle( $shuffled );
# 配列を配列リファレンスで渡すように変更
shuffle( \@shuffled );

my $same_count = 0;

foreach my $index (0..$#array){
    #$same_count++ if $shuffled->[$index] eq $array->[$index];
    # 上記変更にともないリファレンスの比較から配列の比較に変更
    $same_count++ if $shuffled[$index] eq $array[$index];
}

#cmp_ok($same_count, '<', $#$array -2,
# 上記変更にともないリファレンスを配列に変更
cmp_ok($same_count, '<', $#array -2, 
  'At least two positions are different');


