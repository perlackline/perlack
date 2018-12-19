#!/usr/bin/perl
use strict;
use warnings;

# nocommenter version 0.2 - Delete the comment line and replacing multiple balnk lines with a single blank line.

# changes: I changed an array variable to a scalar variable.
# @lines -> $line

my $in = shift or help();
my $out = shift or help();
die "$in is not FILE!\n" unless (-f $in);
# ファイルがない場合に作成するためひとまずコメントアウト
#die "$out is not FILE!\n" unless (-f $out);
open my $fh_in, '<', $in or die "Cannot open $in: $!"; 
open my $fh_out, '>', $out or die "Cannot open $out: $!"; 

# delete the comment line
# コメント行の削除

my $line;
while (<$fh_in>){

  # read with one line
	$line .= $_ unless (/^\s*#/);
}

# reduce blank line to one
# 重複する空行をひとつにする

$line =~ s/\n{3,}/\n\n/g;

# separate by line break and set to array
# 改行で分割して配列に格納

my @lines = split /\n/, $line;

# write with one line
# 1 行ずつ書き込み

print $fh_out "$_\n" for (@lines);

close $fh_in;
close $fh_out;

# check invocation args.
# 起動引数チェック

sub help {
  # $0 => このスクリプトのファイル名
  die "please set args [$0 input_file output_file]\n";
}

