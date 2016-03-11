#!/usr/bin/perl

use strict;
use warnings;

my $string = 'Hello string';
my @old_value = qw/elm0 elm1 elm2/;
my %some_table = ( key0 => 'val0', key1 => 'val1' );
sub some_function { print "Hello sub\n"; }

#my $rec = {
#  TEXT     => $string,
#  SEQUENCE => [ @old_value ],
#  LOOKUP   => { %some_table },
#  THATCODE => \&some_function, 
#  THISCODE => sub { $_[0] ** $_[1] },
#  # File handle glob ref
#  HANDLE   => \*STDIN,
#};

my $rec = [ \*STDOUT ];
# ok !
print {$rec->[0]} "a string\n";
# error !
print $rec->[0] "a string\n";
# ok !
print {${$rec}[0]} "a string\n";
# error !
print ${$rec}[0] "a string\n";

# ---
# OK !
#print { $rec->{HANDLE} } "a string\n";

# ---
# Error ! omit curly brace
#print $rec->{HANDLE} "a string\n";

#open $rec->{HANDLE}, '<', 'test.txt' or die "$!";
#
#my $string = <$rec->{HANDLE}>;
#close $rec->{HANDLE};
#
#print "$string\n";
#

# ---
# Copy to scalar
#my $fh = $rec->{HANDLE};
# OK !
#print $fh "a string\n";
