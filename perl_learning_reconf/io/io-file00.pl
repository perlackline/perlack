#!/usr/bin/perl

use strict;
use warnings;

use IO::File;

my $file = 'text.file';
my $fh = IO::File->new();

#use Data::Dumper;
#print Dumper $fh;
#$fh->open("< $file") or die "Could not open $file: $!";
#$fh->open("> $file") or die "Could not open $file: $!";
#$fh->open(">> $file") or die "Could not open $file: $!";

#$fh->open($file, '<') or die "Could not open $file: $!";
#$fh->open($file, '>') or die "Could not open $file: $!";
#$fh->open($file, '>>') or die "Could not open $file: $!";

#$fh->open($file, 'r') or die "Could not open $file: $!";
#$fh->open($file, 'w') or die "Could not open $file: $!";
#$fh->open($file, 'a') or die "Could not open $file: $!";

#$fh->open($file, O_RDONLY) or die "Could not open $file: $!";
#$fh->open($file, O_WRONLY | O_TRUNC | O_CREAT) or die "Could not open $file: $!";
$fh->open($file, O_RDWR) or die "Could not open $file: $!";
#$fh->open($file, O_WRONLY | O_APPEND) or die "Could not open $file: $!";
#$fh->open($file, O_APPEND) or die "Could not open $file: $!";

print "---\n";
#print Dumper $fh;
print $fh "adding some text..\n";
#print <$fh>;
#$fh->close;

