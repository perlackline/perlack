#!/usr/bin/perl

use strict;
use warnings;

print "3 * (5 + 3)" . "\n";

#print eval("3 * (5 + 3)") . "\n";
print eval { eval("3 * (5 + 3)") } . "\n";

