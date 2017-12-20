#!/usr/bin/perl

# http://perldoc.jp/docs/modules/version-0.77/version.pod

package Foo;
our $VERSION = 1.2;

package Bar;
our $VERSION = "v1.3.5"; # works with all Perl's (since it is quoted)

package main;

use strict;
use warnings;

use version;

print $Foo::VERSION, "\n"; # prints 1.2
print $Bar::VERSION, "\n"; # prints 1.003005
                           #? prints v1.3.5

# ?

#eval "use foo 10";
#print $@; # prints "foo version 10 required..."
eval "use foo 1.3.5"; # work in Perl 5.6.1 or better
print $@; # prints "foo version 1.3.5 required..."

#eval "use bar 1.3.6";
#print $@; # prints "bar version 1.3.6 required..."
#eval "use bar 1.004";
#print $@; # prints "bar version 1.004 required..."

