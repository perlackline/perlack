#!/usr/bin/perl

#use strict;
#use warnings;

use Data::Dumper;

# http://www.perlmonks.org/?node_id=735446

$Data::Dumper::Deparse = 1;

$foo = sub{return []};
$bar = {arefpromise => $foo};
$d = Data::Dumper->new([$bar]);
print "foo is coderef retuning ".$foo->()."\n";
#$d->Seen({$foo => $foo->()});
print $d->Dump();
#$d->Reset;
print $d->Dump();
