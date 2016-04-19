#!/usr/bin/perl

#use strict;
#use warnings;

use Data::Dumper;

########
# object-oriented usage
########
$a = "pearl";
$b = [ $a ];
$c = { 'b' => $b };
$d = [ $c ];
$e = { 'd' => $d };
$f = { 'e' => $e };

#$d = Data::Dumper->new([$a,$b,$c,$d,$e,$f],[qw(a b c d e f)]);
#$dmp = Data::Dumper->new([$f],[qw(f)]);
$dmp = Data::Dumper->new([$a,$b, $c],[ qw(a b c) ]);

#$dmp->Reset->Purity(0);
#print join "----\n", $dmp->Dump;
print $dmp->Dump;
#print "--- --- ---\n";
#$dmp->Reset;
#map{ print "$_---\n"} $dmp->Dump;
# stash a ref without printing it
#$dmp->Seen( {'*c' => $c} );
#$dmp->Seen( {'*d' => $d} );
#$dmp->Indent(3);
#print $dmp->Dump;

#print Dumper($f);
#print "--- ---\n";
#print $dmp->Seen, "\n";
#print Dumper($f);
#print Data::Dumper->Dump([$f]);
#print Data::Dumper->Dump([$f]);
# empty the seen cache
#$dmp->Reset->Purity(0);
#$dmp->Seen( {'*d' => $d} );
#print join "----\n", $dmp->Dump;


