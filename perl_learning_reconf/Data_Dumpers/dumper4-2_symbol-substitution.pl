#!/usr/bin/perl

#use strict;
#use warnings;

########
# symbol substitution (useful for recreating CODE refs)
########
# シンボルの置換 ( 便利 CODE レフの再作成に )

use Data::Dumper;
sub foo { print "foo speaking\n" }
sub baz { print "baz speaking\n" }
sub qux { print "qux speaking\n" }

# ARRAY REF
$bar = [ \&foo, \&baz, \&qux ];

$d = Data::Dumper->new([$bar],['bar']);

$d->Seen({'*foo'=>\&foo,'*baz'=>\&baz,'*qux'=>\&qux});

print $d->Dump;
