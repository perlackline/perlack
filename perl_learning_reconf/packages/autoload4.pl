#!/usr/bin/perl

use strict;
use warnings;

# check AUTOLOAD

*main::subrtn = sub { print "Hello, subroutine!\n" };

&{main::subrtn};
&main::subrtn;
main::subrtn->();
