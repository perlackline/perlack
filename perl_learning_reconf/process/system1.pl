#!/usr/bin/perl

use strict;
use warnings;

# indirect object ???

#my $echo = '/bin/echo';
#exec { $echo } 'Hello', 'hello';
#exec { '/bin/sleep' } 'sleeping', 1000;

#my @args = ( "echo", "surprise");
#exec { $args[0] } @args;



#exec 'sleep 100'; # bash
#exec 'sleep', '100'; # bash? 

#system 'echo system';
#exec 'echo', 'Hello';
#print "retuen?\n";


#system 'echo Hello; sleep 100';
#system 'sleep', '100';
#system 'sleep 100';

#my $lang = $ENV{"LANG"};

#system 'echo', $lang;
#system 'printf', 'LANG=[%s]\n', $lang, '>', 'env.pl';
#system 'printf \'LANG=[%s]\n\' $LANG > env2.pl';
#system 'printf \'LANG=[%s]\n\' $LANG > env2.list';
#system 'ls -l $HOME';
#system 'echo $SHELL';

#system 'find / -iname \'*CGI.pm\' 2> /dev/null &';
#system 'find /bin -iname \'cat\' &';

#foreach (1..30){
#  print "$_\n" if $_ < 30;
#}

#my @arry = qw( . | grep pl);
#my @arry = qw( system1.pl env.list );
my @arry = <STDIN>;
chomp @arry;
#my @arry = qw( | grep *pl );
#system "ls -l @arry";
#system 'cat', @arry;
system ("cat @arry") == 0 or die "faild: $?";

#system 'for i in skl.pl; do echo == $i ==; cat $i; done';


## ============================
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

