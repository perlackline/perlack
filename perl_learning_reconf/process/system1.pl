#!/usr/bin/perl

use strict;
use warnings;

# indirect object ???
#my $echo = '/bin/echo';
#exec { '/bin/echo' } 'Hello';
#exec { '/bin/sleep' } 'sleeping', 1000;
#exec 'sleep 100'; # bash
exec 'sleep', '100'; # bash? 

#system 'echo system';
#exec 'echo', 'Hello';
#print "retuen?\n";

#my $lang = $ENV{"LANG"};

#system 'echo', $lang;
#system 'printf', 'LANG=[%s]\n', $lang, '>', 'env.pl';
#system 'printf \'LANG=[%s]\n\' $LANG > env2.pl';
#system 'printf \'LANG=[%s]\n\' $LANG > env2.list';
#system 'ls -l $HOME';
#system 'echo $SHELL';

#system 'find / -iname \'*CGI.pm\' 2> /dev/null &';
#system 'find / -iname \'*CGI.pm\' 2> /dev/null';


#foreach (1..9){
#  print "$_\n" if $_ < 10;
#}

#system 'for i in skl.pl; do echo == $i ==; cat $i; done';


#sub high_water_mark {
#  my $ref_length = shift;
#  my $max_length = length $ref_length;
#
#  foreach (@_) {
#    my $next_length = length $_;
#    if ($next_length > $max_length) {
#      $max_length = $next_length;
#    }
#  }
#  "%-${max_length}s : %s\n";
#}
#my @keys = sort(keys %ENV);
#my $format = high_water_mark(@keys);
#
## ============================
#foreach (@keys){
#  printf $format, $_, $ENV{$_};
#}
## ============================
