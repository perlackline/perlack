#!/usr/bin/perl

use strict;
use warnings;

my $string = 'Hello string';
my @old_value = qw/elm0 elm1 elm2/;
my %some_table = ( key0 => 'val0', key1 => 'val1' );
sub some_function { print "Hello sub\n"; }

my $rec = {
  TEXT     => $string,
  SEQUENCE => [ @old_value ],
  LOOKUP   => { %some_table },
  THATCODE => \&some_function, 
  THISCODE => sub { $_[0] ** $_[1] },
  # File handle glob ref
  HANDLE   => \*STDOUT,
};

#use FileHandle;
use IO::Handle;
$rec->{HANDLE}->print(" a string\n");

# ---
# OK !
#print { $rec->{HANDLE} } "a string\n";

# ---
# Error ! omit curly brace
#print $rec->{HANDLE} "a string\n";

# ---
# Copy to scalar
#my $fh = $rec->{HANDLE};
# OK !
#print $fh "a string\n";

#print ${$rec}{HANDLE} "a string\n";


#${$rec}{THATCODE}();
#$rec->{THATCODE}();
#$rec->{THATCODE}->();
#my $answer2 = $rec->{THISCODE}(2,2);
#print "$answer2\n";

#my ($key,$val) = each %{ $rec->{LOOKUP} };
#print "key: $key, val: $val\n";

#print ${$rec}{LOOKUP}{key0}, "\n";
#print $$rec{LOOKUP}{key0}, "\n";
#print $rec->{LOOKUP}->{key0}, "\n";
#print $rec->{LOOKUP}{key0}, "\n";

#my $last = pop @{ $rec->{SEQUENCE} };
#print "$last\n";
#print ${$rec}{SEQUENCE}[0], "\n";
#print $rec->{SEQUENCE}->[1], "\n";
#print $rec->{SEQUENCE}[2], "\n";

#print $rec->{TEXT}, "\n";
#print ${$rec}{TEXT}, "\n";
#print $$rec{TEXT}, "\n";

#use Data::Dumper::Concise;
#print Dumper $rec;

# http://hirobanex.net/article/2013/09/1380449012
#use DDP {deparse => 1};
#p $rec;

