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

# ARRAY REF
$bar = [ \&other ];

# Dereference
# foo speaking\n
#$$bar[0]->();

#$d = Data::Dumper->new([\&foo],['foo']);
$d = Data::Dumper->new([\&other, $bar],['*other', 'bar']);
$d->Seen({'*foo' => \&foo });
print $d->Dump;

print "---\n";

$code = $$bar[0];
#&{$code};
$code->();
