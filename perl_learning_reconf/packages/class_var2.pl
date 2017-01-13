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
  $REGISTRY{$self} = $self;

  # インスタンスへの参照を弱いリファレンスにする
  #use Scalar::Util qw(weaken);
  #weaken ($REGISTRY{$self});
  $self;
}

# 記憶したインスタンスを変えすゲッター
sub registered {
  map { 'a '. ref($_) .' named '. $_->name } values %REGISTRY;
}

sub name {
  my $either = shift; 
  ref $either ? $either->{Name} : "an unnamed $either";
}
sub relation { shift->{Relation} }

# デストラクタ
sub DESTROY {
  my $self = shift;
  warn '['. $self->name .' has died ...]';

  # エントリを削除する
  delete $REGISTRY{$self};
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

# block 内でコンストラクト
{
  my $parent  = Parent->new('Rayhunton');
  my $anon    = Child->new('anon', 'orphan');
  print "(in block):\n", map("  $_\n", Parent->registered);
}

# block 外でコンストラクト
my $aida    = Child->new('Aida', 'sister', 'Pirate Corps');
my $bellri  = Child->new('Bellri', 'brother', 'Capital Guard');
print "(after block):\n", map("  $_\n", Parent->registered);

print "---\n";
print "End of program\n";



