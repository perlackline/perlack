#!/usr/bin/perl

use strict;
use warnings;

# check destroy
# create temp file..

package Animal;

# 一時ファイルを操作するモジュール
use File::Temp qw(tempfile);

# コンストラクタ
sub new {
  my $class = shift;
  my $name = shift || 'Tarou';
  my $self = { Name => $name };

  # 一時ファイルのファイルハンドルとファイル名を取得 
  my ($fh, $filename) = tempfile(DIR => '.');
  #my ($fh, $filename) = tempfile( UNLINK => 1 );

  # それぞれをアトリビュートとしてセット
  $self->{temp_fh} = $fh;
  $self->{temp_filename} = $filename;
  # ---

  bless $self, $class;
}

# 名前のアクセサ
sub name {
  my $either = shift;
  ref $either ? $either->{Name} : "an unnamed $either";
}

# 一時ファイルの名前のゲッター
sub tmp_get_name {
  my $self = shift;
  $self->{temp_filename};
}

# ライター
sub tmp_write {
  my $self = shift;
  my $fh = $self->{temp_fh};
  print $fh @_;
}

# リーダー
sub tmp_read{

  # ファイルポインタが末尾にあるため先頭にリセットしてから読み込み
  use Fcntl ':seek';
  my $self = shift;
  seek $self->{temp_fh}, 0,SEEK_SET or die "Cannot seek fh:$!";
  my @lines = readline $self->{temp_fh};

  # 読み込んだ内容をリターン
  join '', @lines;
 }

# デストラクタ
sub DESTROY {
  my $self = shift;

  # ファイルハンドルをクローズ
  my $fh = $self->{temp_fh};
  # close $fh;
  close $self->{temp_fh};

  # ファイルを削除
  warn 'unlink: ', $self->{temp_filename}, "\n";
  unlink $self->{temp_filename};

  warn '[', $self->name, " has died.]\n";
  #$self->SUPER::DESTROY if $self->can("SUPER::DESTROY");
}

package Horse;
our @ISA = qw( Animal );

sub DESTROY {
  my $self = shift;
#  foreach my $class (@ISA){
#    my $destroy = "${class};;DESTROY";
#    $self->$destroy if $self->can($destroy);
#  }
  print "Bye! by Horse.\n";
  $self->SUPER::DESTROY;
}

package main;

my $horse = Horse->new;

print $horse->tmp_get_name, "\n";
$horse->tmp_write("It's Horse object!\nsecond line\n");
print "READ:\n", $horse->tmp_read;

#sleep 5;

print "End of program.\n";

