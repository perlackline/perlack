#!/usr/bin/perl

# http://d.hatena.ne.jp/minesouta/20080314/p1

use strict;
use warnings;

package Member;
use Class::MethodMaker
 [
  scalar => 'id',
  array  => 'record',
  new    => 'new'
 ];

package PremiumMember; # Member を継承
use base qw( Member );
use Class::MethodMaker
 [
  scalar => [qw( rank premium_id )],
  hash   => 'etc',
  new    => 'new',
 ];

# ---
package main;
my $member = PremiumMember->new();
$member->id(10);
$member->premium_id(11);
$member->record('a','b','c');
$member->rank(3);
$member->etc(address=>'tokyo');

# _index 等は以下の .m ドキュメントで確認可能
# http://cpansearch.perl.org/src/SCHWIGON/Class-MethodMaker-2.24/components/
# または旧バージョンのドキュメント
# http://search.cpan.org/~fluffy/Class-MethodMaker-1.12/lib/Class/MethodMaker.pm
print map{ $_, "\n" }
  $member->id,                   # 10
  $member->premium_id,           # 11
  $member->rank,                 # 3
  $member->record_index(2),      # c
  $member->etc_index('address'); # tokyo

