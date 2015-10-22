#!/usr/bin/perl

use strict;
use warnings;

open my $status, "netstat -an 2>&1 |" or die "can't fork: $!";
 
while (<$status>) {
  next unless /^(tcp|udp)/;
  print;
}
close $status or die "bad netstat: $! $?";

# open my $fh, '-|', 'date';
# my $date = <$fh>;
# close $fh;
# print "$date";
# 

# open my $top_fh, '-|', 'top', '-d 5' or die "fork: $!";
# print "   PID USER      PR  NI  VIRT  RES  SHR S %CPU %MEM    TIME+  COMMAND\n";
# while (<$top_fh>) {
#   next unless /httpd/;
#   print $_;
# }


# open my $find_fh, '-|',
#   'find', qw( / -atime +90 -size +1000 -print)
#   or die "fork: $!";
# 
# while (<$find_fh>) {
#   chomp;
#   printf "%s\n size %dk last accessed %.2f days ago\n",
#     $_, (1023 + -s $_)/1024, -A $_;
# }

