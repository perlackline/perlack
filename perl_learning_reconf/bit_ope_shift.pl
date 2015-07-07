#!/usr/bin/perl

use strict;
use warnings;

# 引数のファイル名を取得
my $file = shift or die "please specify any file to argument:$!";

# ファイルのモードを取得
my $mode = (stat($file))[2];

# bit の初期化
my $bit= 1;
foreach my $count (0 .. 8) { 

    # Others の権限をチェック
    print "Others: \n" if ( $count == 0 ) ;
    if ($count == 0) {
      # $bit = 000 000 001
      ($mode & $bit) ? print "  executable\n"
                     : print "  not executable\n";
    }
    if ($count == 1) {
      # $bit = 000 000 010
      ($mode & $bit) ? print "  writable\n"
                     : print "  not writable\n";
    }
    if ($count == 2) {
      # $bit = 000 000 100
      ($mode & $bit) ? print "  readable\n"
                     :print "  not readable\n";
    }

    # Group の権限をチェック
    print "Group: \n" if ( $count == 3 ) ;
    if ($count == 3) {
      # $bit = 000 001 000
      ($mode & $bit) ? print "  executable\n"
                     :print "  not executable\n";
    }
    if ($count == 4) {
      # $bit = 000 010 000
      ($mode & $bit) ? print "  writable\n"
                     :print "  not writable\n";
    }
    if ($count == 5) {
      # $bit = 000 100 000
      ($mode & $bit) ? print "  readable\n"
                     :print "  not readable\n";
    }

    # User の権限をチェック
    print "User: \n" if ( $count == 6 ) ;
    if ($count == 6) {
      # $bit = 001 000 000
      ($mode & $bit) ? print "  executable\n"
                     :print "  not executable\n";
    }
    if ($count == 7) {
      # $bit = 010 000 000
      ($mode & $bit) ? print "  writable\n"
                     :print "  not writable\n";
    }
    if ($count == 8) {
      # $bit = 100 000 000
      ($mode & $bit) ? print "  readable\n"
                     :print "  not readable\n";
    }

    # ビットシフト
    # printf "    bit: %09b\n", $bit;
    $bit <<= 1;
}  

