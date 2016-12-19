#!/usr/bin/perl

use strict;
use warnings;

use File::Temp qw(tempfile);

my($fh,$filename) = tempfile;
print "file name: $filename\n";
print $fh "test write to temp file.\n";

print "---\n";
system "cat $filename";
print "---\n";
#sleep 15;
#my @lines = readline $fh;
print "---\n";
use Fcntl ':seek';
seek $fh, 0,SEEK_SET or die "Cannot seek '$fh':$!";
#my @lines = <$fh>;
my @lines = readline $fh;
print "lines: ", @lines;
print "---\n";

#print "@lines\n";


