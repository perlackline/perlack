#!/usr/bin/perl
# ディレクトリ操作
use strict;
use warnings;

#my $dir = '/tmp';
chdir '..' or die "cannot chdir to ../: $!";
my $dir = './';
opendir my $dh, $dir or die "Cannot open $dir: $!";

#my @dots = grep { /^\./ && -f "$dir/$_" } readdir($dh);
my @dots = grep { -d "$dir/$_" } readdir($dh);

closedir $dh;

foreach my $file (@dots){
  print "$file\n";
}

#foreach my $file (sort (readdir $dh)) {
#  #next unless $file =~ /^P/;
#  next if $file =~ /^\.\.?$/;
#  print "$file\n";
#}

