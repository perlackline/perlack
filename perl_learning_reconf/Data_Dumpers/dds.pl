#!/usr/bin/perl

#use strict;
#use warnings;

# http://www.perlmonks.org/?node=Hooks%20like%20Storable%20for%20Dumper%3F
use Data::Dump::Streamer;

sub Popsicle::Freeze {
  my ($self) = @_;
  $_[0] = bless \do{ my $x=join "-",@$self}, ref $self;
}

sub Popsicle::Thaw {
  my ($self) = @_;
  $_[0] = bless [ map {split /-/,$_} $$self ], ref $self;
}

my $ig = bless [ "A".."C" ],"Popsicle";
my $h = (One=>1,Two=>2,Three=>$ig);

# "fix" statement thaw...
Dump->Names('first')
  ->Freezer('Popsicle'=>'Freeze')
  ->Freezer('Popsicle'=>'Thaw')
  ->Data( \%h )->Out;
print "\n";

# inline thaw...
Dump->Names('second')
  ->Freezer('Popsicle'=>'Freeze')
  ->Freezer('Popsicle'=>'Thaw')
  ->Data( \%h )->Out;
print "\n";

# clear the hooks for Popsicle
Dump->Names('third')
  ->Freezer('Popsicle'=>'')
  ->Freezer('Popsicle'=>'')
  ->Data( \%h )->Out;
print "\n";

