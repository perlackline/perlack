#!/usr/bin/perl

use strict;
use warnings;

use Time::Piece;

my $file = shift;

my (
 $dev, $ino, $mode, $nlink,
 $uid, $gid, $rdev, $size,
 $atime, $mtime, $ctime, $blksize,
 $blocks) = stat($file);

#$atime = localtime($atime)->ymd;
#$mtime = localtime($mtime)->ymd;
#$ctime = localtime($ctime)->ymd;
#
#print "File: $file
#Size  : $size   Blocks: $blocks    IO Block: $blksize    ---
#Device: $dev	inode: $ino        Links: $nlink
#Access: $mode    Uid: $uid    Gid: $gid
#Access: $atime
#Modify: $mtime
#Change: $ctime\n";

printf "File: %s
Size  : %d\tBlock: %s\tIO Block: %d\t ---
Device: %s\tInode: %s\tLinks: %s
Access: %s\tUid: %d\tGid: %d
Access: %s
Modify: %s
Change: %s",
$file, $size, $blocks, $blksize, $dev, $ino, $nlink, $mode, $uid, $gid,
localtime($atime)->ymd, localtime($mtime)->ymd, localtime($ctime);
