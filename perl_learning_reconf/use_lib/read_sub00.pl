#!/usr/bin/perl

use strict;
use warnings;

# print "Printed this with read.pl\n";

#{
#  open my $fh, '<', 'print_sub.pl' or die "print_sub.pl: $!";
#  #local $/; # 一気飲みモード
#  #$/ = undef; # 一気飲みモード
#  undef $/; # 一気飲みモード
#  my $more_code = <$fh>;
#  close $fh;
#  eval $more_code;
#  die $@ if $@;
#}

#eval `cat print_sub.pl`;
#do 'print_sub.pl';
#die $@ if $@;
#require 'print_sub.pl';

#use lib '/home/your/dir/lib/subs/';
BEGIN { unshift @INC,  '/home/your/dir/lib/subs/'; }

require subs::print_sub;

hello('Henry');
#afternoon('Bergkamp');
#evening('Sánchez');
#respect('Arsène');

