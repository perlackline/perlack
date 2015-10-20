#!/usr/bin/perl

use strict;
use warnings;

open my $echo_fh, '|echo morning!' or die "$!";

#chomp(my $result = <$echo_fh>);
#print "$result\n";

print "into the sleep ....\n";

foreach ( 0..2 ){
  print "$_!\n";
  sleep 1;
}

print "done\n";


# open my $status, "netstat -an 2>&1 |" or die "can't fork: $!";
# 
# while (<$status>) {
#   next if /^(tcp|udp)/;
#   print;
# }
# close $status or die "bad netstat: $! $?";

# open my $fh, '-|', 'date';
# my $date = <$fh>;
# close $fh;
# print "$date";
# 
# open my $top_fh, '-|', 'top';
# while (<$top_fh>) {
#   next unless /httpd/;
#   print $_;
# }


# open my $find_fh, '-|',
#   'find', qw( /home/ohira -atime +90 -size +1000 -print)
#   or die "fork: $!";
# 
# while (<$find_fh>) {
#   chomp;
#   printf "%s size %dk last accessed %.2f days ago\n",
#     $_, (1023 + -s $_)/1024, -A $_;
# }

