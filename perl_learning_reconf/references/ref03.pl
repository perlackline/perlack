#!/usr/bin/perl

use strict;
use warnings;

my @list_a   = qw( G E A );
my @list_b   = qw( A B F C );
my @list_c   = qw( B C D F G );

my @list_A = ('list_a', \@list_a); 
my @list_B = ('list_b', \@list_b); 
my @list_C = ('list_c', \@list_c); 

my @All_list = (\@list_A, \@list_B, \@list_C);

use Data::Dumper;
map {print Dumper $_ } @All_list;  

#check_items($_) for @All_list;
#
#sub check_items {
#  my $ary_ref  = shift;
#  my @required = qw( A B C D E F G );
#  my @missings = ();
#
#print Dumper $ary_ref;  
#
#  foreach my $item (@required) {
#    push @missings, $item unless (grep {$item eq $_} @{${$ary_ref}[1]});
#  }
#  print "@{$ary_ref}[0] is missing [@missings].\n";
#}
#
