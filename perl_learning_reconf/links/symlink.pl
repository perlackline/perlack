#!/usr/bin/perl

use strict;
use warnings;

print "\n--- Create symlink ---\n";

foreach my $file (glob '*') {

  # ファイルが symlink なら next
  next if -l $file;

  # symlink のファイルがすでに存在するなら next
  next if -e ($file . '_dsln');
  next if -e ($file . '_fsln');

  # ディレクトリの処理
  if ( -d $file ) {

    print "dir: $file\n";
    symlink $file, $file . '_dsln'
        or warn "Can't create symlink for $file:$!";

  # ファイルの処理
  } elsif ( -f _ ) {

    print "file: $file\n";
    symlink $file, $file . '_fsln'
        or warn "Can't create symlink for $file:$!";

  # ディレクトリでのファイルでもないなら next
  } else {
    next;
  }

}

print "\n";

