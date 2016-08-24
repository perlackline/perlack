#!/usr/bin/perl

use strict;
use warnings;

use IO::File;

my $file = 'text.file';
#my $fh = IO::File->new("< $file") or die "Could not create filehandle: $!";
#my $fh = IO::File->new("> $file") or die "Could not create filehandle: $!";
#my $fh = IO::File->new(">> $file") or die "Could not create filehandle: $!";

#my $fh = IO::File->new($file, '<') or die "Could not create filehandle: $!";
#my $fh = IO::File->new($file, '>') or die "Could not create filehandle: $!";
#my $fh = IO::File->new($file, '>>') or die "Could not create filehandle: $!";

#my $fh = IO::File->new($file, 'r') or die "Could not create filehandle: $!";
#my $fh = IO::File->new($file, 'w') or die "Could not create filehandle: $!";
#my $fh = IO::File->new($file, 'a') or die "Could not create filehandle: $!";

#my $fh = IO::File->new($file, O_RDONLY) or die "Could not create filehandle: $!";
#my $fh = IO::File->new($file, O_WRONLY | O_TRUNC | O_CREAT) or die "Could not create filehandle: $!";
my $fh = IO::File->new($file, O_WRONLY | O_APPEND | O_CREAT) or die "Could not create filehandle: $!";

print "---\n";
#print Dumper $fh;
print $fh "adding some text..\n";
#print <$fh>;
#$fh->close;

