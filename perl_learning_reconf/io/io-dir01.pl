#!/usr/bin/perl

use 5.012; # readdir assigns to $_ in a lone while test
use strict;
use warnings;

use IO::Dir;

my $dirname = 'io-dirs';
my $dh = IO::Dir->new;

$dh->open($dirname);

print "tell: ", $dh->tell, "\n";
print "---\n";
while(defined(my $file = $dh->read)){
#while($dh->read){
  # does not assign to $_ ...
  #print "$dirname/$_\n";
  print "$dirname/$file\n";
  print "tell: ", $dh->tell, "\n";
} 

#print "--- read ---\n";
#my @dirs = $dh->read;
#print "$_\n" for @dirs;
#
#print "--- tell ---\n";
#my $tell = $dh->tell;
#print "tell: $tell\n";
