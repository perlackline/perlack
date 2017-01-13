#!/usr/bin/perl

use strict;
use warnings;

# check Class Variable

# 親クラス
package Parent;

# 記憶のための変数
our %REGISTRY;
sub new {
  my $class = shift;
  my $name = shift || 'Tarou';
  my $relation = shift || 'parent';
  my $self = { Name => $name, Relation => $relation };
  bless $self, $class;

  # インスタンスを記憶
  $REGISTRY{$self} = $self;

  # bless 済みのインスタンスをリターン
  $self;
}

# 記憶したインスタンスを変えすゲッター
sub registered {
  map { 'a '. ref($_) .' named '. $_->name } values %REGISTRY;
}

# アクセサ
sub name {
  my $either = shift; 
  ref $either ? $either->{Name} : "an unnamed $either";
}
sub relation { shift->{Relation} }

# デストラクタ
sub DESTROY {
  my $self = shift;

  # warn ( without \n )
  warn '['. $self->name ." has died ...]";
}

# 子クラス
package Child;
our @ISA = qw(Parent);
sub new {
  my $affiliation = pop || 'Independent';
  my $self = shift->SUPER::new(@_);
  $self->{Affiliation} = $affiliation;
  $self;
}

# アクセサ
sub affiliation { shift->{Affiliation} };

# メイン
package main;

# オブジェクトのコンストラクト
my $parent  = Parent->new('Rayhunton');
my $anon    = Child->new('anon', 'orphan');
my $aida    = Child->new('Aida', 'sister', 'Pirate Corps');
my $bellri  = Child->new('Bellri', 'brother', 'Capital Guard');

# 名前 ( name ) と関係 ( relation ) を出力
print $parent->name. ": ". $parent->relation ."\n";
print $anon->name. ": ". $anon->relation .", ". $anon->affiliation ."\n";
print $aida->name. ": ". $aida->relation .", ". $aida->affiliation ."\n";
print $bellri->name. ": ". $bellri->relation .", ". $bellri->affiliation ."\n";

print "---\n";

# 生存しているインスタンスを出力
print "A living instance:\n", map("  $_\n", Parent->registered);

# プログラムの終了
print "End of program\n";



