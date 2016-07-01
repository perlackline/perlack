#!/usr/bin/perl

use strict;
use warnings;

use File::Find;
use Time::Local;

sub gather_mtime_between{
  my $start = shift;
  my $stop  = shift;
  my @items;

  return (
    # $gather
    sub { my $timestamp = (stat $_)[9];
          unless (defined $timestamp){
            warn "Can't stat $File::Find::name: $!, skipping\n";
            return;
          }
          push @items ,$File::Find::name if ($timestamp >= $start and $timestamp < $stop);
        },
    # $yield
    sub { return @items; }); 
}

#my $target_dow = 1;  # 0 = 日, 1 = 月 ...
my $target_dow = 5;  # 0 = 日, 1 = 月 ...
my @starting_directories = (".");

my $seconds_per_day = 24 * 60 * 60;
my ($sec,$min,$hour,$day,$mon,$yr,$dow) = localtime;
# 今日の 00:00:00
my $start = timelocal(0,0,0,$day,$mon,$yr); 

# 目的の曜日と今日の曜日を比較
# 曜日が異なる場合ループ
while ($dow != $target_dow){
  # 今日から 1 日戻る ( 1 日秒減算 )
  # サマータイムは無視
  $start -= $seconds_per_day;

  # 曜日調整
  if(--$dow < 0){
    $dow += 7;
  }
}

# 終了のタイムスタンプ (開始 + 1 日秒)
my $stop = $start + $seconds_per_day;

# 2 つのコールバックをセット
my($gather,$yield) = gather_mtime_between($start,$stop);
find($gather,@starting_directories);
my @files = $yield->();

for my $file (@files){
  next if $file =~ /\A\.\z/;
  # スライスから mtime を取得
  my $mtime = (stat $file)[9];
  my $when = localtime $mtime;
  print "$when: $file\n";
}

