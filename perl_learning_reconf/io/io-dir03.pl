#!/usr/bin/perl

use strict;
use warnings;

use IO::Dir;

#tie my %dir, 'IO::Dir', "io-dirs";
# 第 3 引数でDIR_UNLINK を ON
my $somedir = 'io-dirs';
tie my %dir, 'IO::Dir', $somedir, 1;

print "$_ : \n" for keys %dir;
print "$_ : \n" for values %dir;

map{
  my $stat = $dir{$_};
  print "--- $_:\n";
  print "dev: ", $stat->dev, "\n";
  print "ino: ", $stat->ino, "\n";
  print "mode: ", $stat->mode, "\n";
  printf "mode: %04o\n", $stat->mode & 07777;
  print "nlink: ", $stat->nlink, "\n";
  print "uid: ", $stat->uid, "\n";
  print "gid: ", $stat->gid, "\n";
  print "rdev: ", $stat->rdev, "\n";
  printf "size: %dbyte\n", $stat->size;
  print "atime: ", $stat->atime, "\n";
  print "atime: ", scalar localtime($stat->atime), "\n";
  print "mtime: ", scalar localtime($stat->mtime), "\n";
  print "ctime: ", scalar localtime($stat->ctime), "\n";
  print "blksize: ", $stat->blksize, "\n";
  print "blocks: ", $stat->blocks, "\n";
} keys %dir;

