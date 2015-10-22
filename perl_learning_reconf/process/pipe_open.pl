#!/usr/bin/perl

use strict;
use warnings;

#open my $cmd_fh, "|cat" or die "$!";
open my $cmd_fh, '-|' "cat", "file1" or die "$!";
#open my $cmd_fh, '|-', "tr '[a-z]' '[A-Z]'"or die "$!";

print $cmd_fh "this is the output of tr!\n";


foreach ( 0..1 ){
  print "$_!\n";
  sleep 1;
}

print "done\n";
close $cmd_fh;


#chomp(my $result = <$echo_fh>);
#print "$result\n";

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

