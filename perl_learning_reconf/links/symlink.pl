#!/usr/bin/perl

use strict;
use warnings;

print "\n--- Create symlink ---\n";

foreach my $file (glob '*') {

  # $B%U%!%$%k$,(B symlink $B$J$i(B next
  next if -l $file;

  # symlink $B$N%U%!%$%k$,$9$G$KB8:_$9$k$J$i(B next
  next if -e ($file . '_dsln');
  next if -e ($file . '_fsln');

  # $B%G%#%l%/%H%j$N=hM}(B
  if ( -d $file ) {

    print "dir: $file\n";
    symlink $file, $file . '_dsln'
        or warn "Can't create symlink for $file:$!";

  # $B%U%!%$%k$N=hM}(B
  } elsif ( -f _ ) {

    print "file: $file\n";
    symlink $file, $file . '_fsln'
        or warn "Can't create symlink for $file:$!";

  # $B%G%#%l%/%H%j$G$N%U%!%$%k$G$b$J$$$J$i(B next
  } else {
    next;
  }

}

print "\n";

