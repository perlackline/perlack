#!/usr/bin/perl
use strict;
use warnings;

# nocommenter version 0.2 - Delete the comment line and replacing multiple balnk lines with a single blank line.

my $in = shift or help();
my $out = shift or help();
die "$in is not FILE!\n" unless (-f $in);
# ファイルがない場合は作成する
# die "$out is not FILE!\n" unless (-f $out);

# open the file
open my $fh_in, '<', $in or die "Cannot open $in: $!"; 
open my $fh_out, '>', $out or die "Cannot open $out: $!"; 

# delete the comment line
# コメント行の削除

my @lines;
while (<$fh_in>){
  chomp;
	push @lines, $_  unless (/^\s*#/);
}

# reduce blank line to one
# 重複する空行をひとつにする

# debug (sleep をミリ秒対応にする module)
#use Time::HiRes qw(sleep);

foreach (0..$#lines) {

 unless ($lines[$_] =~ /^$/ && $lines[$_ + 1] =~ /^$/){
   print $fh_out "$lines[$_]\n"; 

	 # debug
	 #sleep 0.5;
	 next;
 }
  # debug
	#sleep 1;
}

close $fh_in;
close $fh_out;

# check invocation args.
# 起動引数チェック

sub help {
  # $0 => このスクリプトのファイル名
  die "please set args [$0 input_file output_file]\n";
}

