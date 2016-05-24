#!/usr/bin/perl

# http://d.hatena.ne.jp/chaichanPaPa/20100206/1265436393
# Perlオブジェクト基礎文法最速マスター

use strict;
use warnings;

# Perl では package が class.
# 通常 class には object を構築する constructor がある.

# Perl の constructor は
# bless で何らかの reference に class 名を紐付けてリターンする.

# リターンされた blessed ref を変数に格納したものが
# object の instance になる.

print "\n*** point 01: package(class) 名が第 1 引数 ***\n";
print "// package00->test00(3) で call //\n";

# class 名 -> method 名
package00->test00(3);

package package00;
sub test00{
  print "\$_[0] = $_[0], \$_[1] = $_[1].\n";
  my $class = shift;
  print "\$_[0] は $class でこれが class 名になる\n";
}

# ---------------------------------

print "\n*** point 02: blessed ref (object) が第 1 引数 ***\n";
my %test_hash = (aaa => 'XXX', bbb => 'YYY');

# $test が package01 object の instance.
my $test = bless \%test_hash, 'package01';

print '$test->{aaa} : ', $test->{aaa}, "\n";
$test->test01(3);
print '$test->{aaa} : ', $test->{aaa}, "\n";

package package01;
sub test01{
  print "// \$_[0] = $_[0], \$_[1] = $_[1]. //\n";
  my $obj_self = shift;
  $obj_self->{aaa} = 'ZZZ';
  print "// \$_[0] = $obj_self でこれは object instance. //\n";
}

# ---------------------------------

print "\n*** point 03: object の例 [委譲]  ***\n";

# new は object の constructor. new を起動 (委譲) する ??
# $obj_pack02 には blessed ref (instance) が格納される.
my $obj_pack02 = package02->new();

print "\$obj_pack02->{bbb} : ", $obj_pack02->{bbb}, "\n";

# object instance を通して class の method test02 をコール.
print "// \$obj_pack02->test02(4); //\n";
$obj_pack02->test02(4);

print "\$obj_pack02->{bbb} : ", $obj_pack02->{bbb}, "\n";

package package02;
sub new{
  print "// \$_[0] = $_[0] で class 名になる //\n";
  my $class = shift;
  my %test_hash = (aaa => 'XXX', bbb => 'YYY');
  return bless \%test_hash, $class;
}
sub test02{
  print "// \$_[0] = $_[0], \$_[1] = $_[1] //\n";
  my $obj_self = shift;
  $obj_self->{bbb} = 'ZZZ';
  print "// \$_[0] = $obj_self で object になる //\n";
}

print "\n";

__END__
# output

*** point 01: package(class) 名が第 1 引数 ***
// package00->test00(3) で call //
$_[0] = package00, $_[1] = 3.
$_[0] は package00 でこれが class 名になる

*** point 02: blessed ref (object) が第 1 引数 ***
$test->{aaa} : XXX
// $_[0] = package01=HASH(0x20d30f8), $_[1] = 3. //
// $_[0] = package01=HASH(0x20d30f8) でこれは object instance. //
$test->{aaa} : ZZZ

*** point 03: object の例 [委譲]  ***
// $_[0] = package02 で class 名になる //
$obj_pack02->{bbb} : YYY
// $obj_pack02->test02(4); //
// $_[0] = package02=HASH(0x20c8420), $_[1] = 4 //
// $_[0] = package02=HASH(0x20c8420) で object になる //
$obj_pack02->{bbb} : ZZZ


