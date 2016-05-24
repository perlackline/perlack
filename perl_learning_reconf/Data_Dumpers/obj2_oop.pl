#!/usr/bin/perl

# http://d.hatena.ne.jp/chaichanPaPa/20100206/1265436393
# Perlオブジェクト基礎文法最速マスター

use strict;
use warnings;

# 通常オブジェクト指向プログラミング (OOP) では
# 以下の要素が必要.
# * capsulation と overeload 以外は標準で対応可能
#   要素        : Perl での対応
#   ---------------------
# + class       : package で対応
# + interface   : 不完全だが package で対応
# + constructor : blessed reference で対応
# + override    : 普通に対応
# + overload    : 同名の sub は不可, ひとつの sub で似た機能を実現
# + capsulation : 標準機能では困難, 各種モジュールを利用
# + 継承        : プラグマ base で対応
# + 委譲        : 普通に対応
# + 多態性      : 普通に対応
#   ---------------------

# 以下は class, constructor, 継承, 多態性, override を利用した例.

# ---------------------------------
my $obj;
my $hiki = shift if @ARGV;

# 条件によって method の振舞いが変化する "多態性" ??
if ($hiki) {
  $obj = Otokonoko->new();
}else{
  $obj = Onnanoko->new();
}
print $obj->getName(), "\n";
$obj->shumi();

print ref $obj,"\n";
# "class" は Person, Otokonoko, Onnanoko.
# ---------------------------------
package Person;

# constructor
sub new{
  my $class = shift;

  # コンストラクタをコールした class 名を設定.
  my $self = { Name => $class };

  # class (package) 名で無名 hashref を bless.
  return bless $self, $class;
}

# 抽象の method, 各 subclass のメソッドで "override" される.
sub getName{};
# ---------------------------------
package Otokonoko;

# プラグマ base で Person を "継承".
use base 'Person';
sub getName{
  my $self = shift;
  return $self->{Name};
}
sub shumi {
  print "バスケ\n";
}
# ---------------------------------
package Onnanoko;

# プラグマ base で Person を "継承".
use base 'Person';
sub getName{
  my $self = shift;
  return $self->{Name};
}
sub shumi{
  print "ケーキ作り\n";
}

