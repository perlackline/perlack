#!/usr/bin/perl

use strict;
use warnings;

our $var = "scalar";
our @var = (1, 2, 3);
sub var { print "sub var\n" }

# scalr
warn "$var\n";
# 1 2 3
warn "@var\n";
# sub var
var();

print "---- glob ---\n";

# *main::var
print *var, "\n";
use Data::Dumper;
# $VAR1 = *::var;
print Dumper *var;

our $foo;
our @foo;
sub foo { }

*foo = *var;

# scalr
warn "$foo\n";
# 1 2 3
warn "@foo\n";
# sub var
foo();

# SCALAR(0x828bc8)
warn *var{SCALAR}, "\n";
# ARRAY(0x828b98)
warn *var{ARRAY}, "\n";
# CODE(0x835908)
warn *var{CODE}, "\n";

# $VAR1 = \'scalar';
warn Dumper *var{SCALAR};
# $VAR1 = [
#           1,
#           2,
#           3
#         ];
#
warn Dumper *var{ARRAY};
# $VAR1 = sub { "DUMMY" };
warn Dumper *var{CODE};




