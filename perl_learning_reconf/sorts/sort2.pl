#!/usr/bin/perl

use strict;
use warnings;

#my @chr =  sort qw/ C A E B D /;
#my @chr =  sort qw/ い え お あ う /;
#my @num =  sort qw/ 99 98 101 100 /;
#my @num =  sort { $a <=> $b } qw/ 99 98 101 100 /;

my $subname = 'by_number';
my @num =  sort $subname qw/ 99 98 101 100 /;

print "@num\n";

sub by_number {
  if ($a < $b) { -1 } elsif ($a > $b) { 1 } else { 0 }
}
#sub by_number {
#  if ($b < $a) { -1 } elsif ($b > $a) { 1 } else { 0 }
#}


#print "@chr\n";
