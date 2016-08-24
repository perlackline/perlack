#!/usr/bin/perl

use strict;
use warnings;
use IO::Handle;

my $io = IO::Handle->new();
if($io->fdopen(fileno(STDIN),"<")){
#if($io->fdopen(fileno(STDIN),"r")){
  print $io->getline;
  $io->close;
}

print "---\n";

#if( defined (my $line = <STDIN>) ){
#  print $line;
#}

