#!/usr/bin/perl

use strict;
use warnings;

#my $string = 'I know you can do it.';
##my $substr = substr($string, index($string, 'can'), 3, "can't");
#substr($string, index($string, 'can'), 3) = "can't";
#
##print "$substr\n";
#print "$string\n";

my $string = "my note, my pen, my book and my desk.";

substr($string, 17) =~ s/my/your/;

print "$string\n";
