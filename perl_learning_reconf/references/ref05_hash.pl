#!/usr/bin/perl

use strict;
use warnings;

my %guest0 = (
  Name        => 'Bellri Zenam',
  Gender      => 'Male',
  Nationality => 'Capital Territory',
);

my %guest1 = (
  Name        => 'Aida Surugan',
  Gender      => 'Female',
  Nationality => 'Ameria',
);

my %guest2 = (
  Name        => 'Raraiya Akuparl',
  Gender      => 'Female',
  Nationality => 'Toasanga',
);

my @guest_book = (\%guest0, \%guest1, \%guest2);

formatter(\@guest_book);

sub formatter {
  my $ref_book = shift;

  my $format = "| %-15s | %-8s | %-17s |\n";
  my $hr =  "+-----------------+----------+-------------------+\n";

  print $hr;
  printf $format, qw(-Name- -Gender- -Nationality-);
  print $hr;
  foreach my $ref_guest (@{$ref_book}){
    printf $format, $ref_guest->{'Name'},
                    $ref_guest->{'Gender'},
                    $ref_guest->{'Nationality'};
    print $hr;
  }
}

#foreach my $hash_ref (@guest_book){
#  foreach my $key ( sort keys %{$hash_ref} ) {
#    print "$key : $hash_ref->{$key}\n";
#  }
#  print "\n";
#}
#
#
