#!/usr/bin/perl

# unlink
foreach my $file (glob 'test0*') {
  unlink $file or warn "faild on $file: $!\n";
}

