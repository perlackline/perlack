#!/usr/bin/perl

use strict;
use warnings;

use IO::File;

my $file = 'text.file';

my $fh = IO::File->new($file, O_RDWR | O_CREAT) or die "Could not create filehandle: $!";

print "---\n";
#print Dumper $fh;
print $fh "mumu..\n";
seek($fh,0,0);
print <$fh>;
#$fh->close;

