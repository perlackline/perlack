#!/usr/bin/perl

use strict;
use warnings;

# /home/your/dir/lib/subs/

use lib '/home/your/dir/lib/subs/';
#use print2;
print "Printed this with read.pl\n";
#
#printer();
#do 'print.pl';
#die $@ if $@;
#require 'print.pl';
#require prints;
require 'prints.pl';

printer();
