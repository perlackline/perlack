#!/usr/bin/perl

use strict;
use warnings;

use Time::Piece;

my $file = shift or die "please specify any file to argument:$!";

my (
 $dev, $ino, $mode, $nlink,
 $uid, $gid, $rdev, $size,
 $atime, $mtime, $ctime, $blksize,
 $blocks
) = stat($file);

my $at = localtime($atime);
my $mt = localtime($mtime);
my $ct = localtime($ctime);

$mode &= 07777;

printf "File: %s
Size  : %d\tBlock: %s\tIO Block: %d\t ---
Device: %s\tInode: %s\tLinks: %s
Access: %04o\tUid: %d\tGid: %d
Access: %s
Modify: %s
Change: %s\n",
$file, $size, $blocks, $blksize, $dev, $ino, $nlink, $mode, $uid, $gid,
$at, $mt, $ct;

