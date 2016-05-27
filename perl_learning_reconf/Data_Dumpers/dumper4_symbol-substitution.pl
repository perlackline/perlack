#!/usr/bin/perl

#use strict;
#use warnings;

########
# symbol substitution (useful for recreating CODE refs)
########
# シンボルの置換 ( 便利 CODE レフの再作成に )

use Data::Dumper;
sub foo { print "foo speaking\n" }
*other = \&foo;
$bar = [ \&other ];
$d = Data::Dumper->new([\&other,$bar],['*other','bar']);
$d->Seen({'*foo'=>\&foo});
print $d->Dump;

