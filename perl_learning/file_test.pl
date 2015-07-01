#!/usr/bin/perl

use strict;
use warnings;
use DateTime;

# ファイルテスト
# すべてのファイルテストを確認するには
# perldoc -f -X

my $filename = shift;

# ファイルの存在確認
#die "Oops! A file called '$filename' already exists.:$!:\n"
#  if -e $filename;
#
#print "ファイル $filename は存在しません\n";

## check read, write
#print "$filename is possible that w, r !\n" if -r $filename && -w _;
## check execution
#print "It's not execution!!\n" unless -x _;
## check modify
#warn "$filename file is looking pretty old.\n"
#  if -M $filename < 10;


print "--- stat() ---\n";
my ($dev,$ino,$mode,$nlink,$uid,$gid,$rdev,$size,
    $atime,$mtime,$ctime,$blksize,$blocks)
    = stat($filename);

print "mtime: $mtime\n";
my $dt = DateTime->from_epoch( epoch => $mtime);
printf "dt: %4d-%02d-%02d\n", $dt->year, $dt->month, $dt->day;

print "--- time ---\n";
my $t = time;
print "time(): $t\n";
my $dtt = DateTime->from_epoch( epoch => $t);
printf "dtt: %4d-%02d-%02d\n", $dtt->year, $dtt->month, $dtt->day;

print "--- T = defautl ---\n";
my $duration = 86400 * (-M $filename);
print "$duration !?\n";
$duration /= 60;
print "(/60): $duration !?\n";
$duration /= 60;
print "(/60/60): $duration !?\n";
$duration /= 24;
print "(/60/60/24): $duration !?\n";

print "--- T = time ---\n";
{
local $^T = time;
my $duration = 86400 * (-M $filename);
print "$duration !?\n";
$duration /= 60;
print "(/60): $duration !?\n";
$duration /= 60;
print "(/60/60): $duration !?\n";
$duration /= 24;
print "(/60/60/24): $duration !?\n";

}

print "--- epoch ---\n";
my $dur = (-M $filename);
print "dur: $dur\n";
my $dttt = DateTime->from_epoch( epoch => $dur);
printf "dtt: %4d-%02d-%02d\n", $dttt->year, $dttt->month, $dttt->day;

