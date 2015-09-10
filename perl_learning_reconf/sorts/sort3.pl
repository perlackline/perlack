#!/usr/bin/perl

use strict;
use warnings;

#my $subname = 'by_number';
#my @num =  sort $subname qw/ 99 98 101 100 /;

#print "@num\n";

#my @chr = sort { $a cmp $b } qw/ A B a b /;
#my @chr = sort { "\L$a" cmp "\L$b" } qw/ A B a b /;
my @chr = sort  qw/ A B a b /;
#my @chr = sort qw/ C B D A /;

print "@chr\n";

sub by_number {
  if ($a < $b) { -1 } elsif ($a > $b) { 1 } else { 0 }

}
sub by_chr {
  if ($a lt $b) { -1 } elsif ($a gt $b) { 1 } else { 0 }

}


