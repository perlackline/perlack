#!/usr/bin/perl

use strict;
use warnings;

#my $command = 'echo';
#my $arg     = 'Hello';
#chomp(my $echo = `$command '$arg'`);
#chomp(my $echo = qx'echo process ID: $$');

#chomp(my $result = qx'find `perl -le \'print for @INC\'` -type f -iname \'*cgi*\'');
#print "$result (in Perl)\n";

#chomp(my @result = `ps`);
#chomp(my @result = `who`);
#foreach (`ps`){
# my( $pid, $tty, $time, $cwd) = /(\S+)\s+(\S+)\s+(\S+)\s+(\S+).*$/;
# print "PID: $pid\nTTY: $tty\nTIME: $time\nCWD: $cwd\n\n";
#}

my %ttys;
foreach ( `who` ) {
   my($user, $tty, $date) = /(\S+)\s+(\S+)\s+(.*)/;
   $ttys{$user} .= "$tty at $date\n";
}
foreach (keys %ttys) {
print "$_\n $ttys{$_}"
}

#print "$result[0]_\n$_\n" for @grep;

#my @opts = '-i';
#my $search_string = 'strict';
#my @filenames = <*>;
#open my $grep, "-|", 'grep', @opts, $search_string, @filenames;
#chomp(my @ok = <$grep>);
#close $grep;
#
#print "$_\n" for @ok;

