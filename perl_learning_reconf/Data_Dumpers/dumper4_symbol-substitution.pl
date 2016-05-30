#!/usr/bin/perl

#use strict;
#use warnings;

########
# symbol substitution (useful for recreating CODE refs)
########
# シンボルの置換 ( 便利 CODE レフの再作成に )

use Data::Dumper;
sub foo { print "foo speaking\n" }
# other の type glob
#*other = *foo{CODE};
*other = \&foo;
$bar = [ \&other ];
#$bar = \&other;
$d = Data::Dumper->new([\&other,$bar],['*other','bar']);
$d->Seen({'*foo'=>\&foo});
print "---\n";
print $d->Dump;

