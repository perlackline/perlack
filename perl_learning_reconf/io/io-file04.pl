#!/usr/bin/perl

use strict;
use warnings;

use IO::File;

my $file = 'text.file';

#my $fh = IO::File->new($file, O_WRONLY | O_TRUNC | O_CREAT) or die "$!";
my $fh = IO::File->new(">$file") or die "$!";


print $fh "first-";

my $pos = $fh->getpos;

print $fh "second-";

#$fh->setpos($pos);

print $fh "third-";

$fh->close;

print "---\n";
open my $fh_read,'<',$file or die "$!";
print <$fh_read>, "\n";




