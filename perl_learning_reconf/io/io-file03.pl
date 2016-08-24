#!/usr/bin/perl

use strict;
use warnings;

use IO::File;

#my $file = 'text.file';

my $fh = IO::File->new_tmpfile or die "$!";
#print $fh "temporary\n";
print $fh "テンポラリ\n";

seek($fh,6,0);
#seek($fh,SEEK_SET,0);
#$fh->flush;
print "read: ", <$fh>;

#seek($fh,0,2);
#print $fh "temporary2\n";
#
#print "---\n";
#seek($fh,SEEK_SET,0);
#print <$fh>;
#
