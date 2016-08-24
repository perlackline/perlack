#!/usr/bin/perl

use strict;
use warnings;
use IO::Handle;

my $file = 'some_text';
open my $fh, '>', $file or die "$!";

$fh->print("some message..\n");

open $fh, '<', $file or die "$!";

print $fh->getline;

print "---\n";

use Data::Dumper;

print Dumper $fh;


#if( defined (my $line = <STDIN>) ){
#  print $line;
#}

