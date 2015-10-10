#!/usr/bin/perl

use strict;
use warnings;

{ package MyDate;
  use vars qw($AUTOLOAD);

  use Carp;

  # Value used for slice index
  my %Allowed_methods = qw( date 3 month 4 year 5 );
  # Offset of localtime()
  my @Offsets         = qw( 0 0 0 0 1 1900 0 0 0);

  # Bless anonymous hash
  sub new { bless {}, $_[0] }
  # Dummy ?
  sub DESTROY { }

  sub AUTOLOAD {
    my $method = $AUTOLOAD;
    # Execlude the package name and get only the method name.
    $method =~ s/.*:://;

    unless ( exists $Allowed_methods{ $method } ) {
      carp "Unknown method: $AUTOLOAD";
      return;
    }

    # Set slice index for localtime()
    my $slice_index = $Allowed_methods{ $method };

    return (localtime)[$slice_index] + $Offsets[$slice_index];
    }
}

# main
use Data::Dumper;

#MyDate->import;
my $date = MyDate->new();
print Dumper($date);

print "The date is "  . $date->date  . "\n";
print "The month is " . $date->month . "\n";
print "The year is "  . $date->year  . "\n";

