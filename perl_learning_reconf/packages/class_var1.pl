#!/usr/bin/perl

use strict;
use warnings;

# check Class Variable

# $B?F%/%i%9(B
package Parent;

# $B5-21$N$?$a$NJQ?t(B
our %REGISTRY;
sub new {
  my $class = shift;
  my $name = shift || 'Tarou';
  my $relation = shift || 'parent';
  my $self = { Name => $name, Relation => $relation };
  bless $self, $class;

  # $B%$%s%9%?%s%9$r5-21(B
  $REGISTRY{$self} = $self;

  # bless $B:Q$_$N%$%s%9%?%s%9$r%j%?!<%s(B
  $self;
}

# $B5-21$7$?%$%s%9%?%s%9$rJQ$($9%2%C%?!<(B
sub registered {
  map { 'a '. ref($_) .' named '. $_->name } values %REGISTRY;
}

# $B%"%/%;%5(B
sub name {
  my $either = shift; 
  ref $either ? $either->{Name} : "an unnamed $either";
}
sub relation { shift->{Relation} }

# $B%G%9%H%i%/%?(B
sub DESTROY {
  my $self = shift;

  # warn ( without \n )
  warn '['. $self->name ." has died ...]";
}

# $B;R%/%i%9(B
package Child;
our @ISA = qw(Parent);
sub new {
  my $affiliation = pop || 'Independent';
  my $self = shift->SUPER::new(@_);
  $self->{Affiliation} = $affiliation;
  $self;
}

# $B%"%/%;%5(B
sub affiliation { shift->{Affiliation} };

# $B%a%$%s(B
package main;

# $B%*%V%8%'%/%H$N%3%s%9%H%i%/%H(B
my $parent  = Parent->new('Rayhunton');
my $anon    = Child->new('anon', 'orphan');
my $aida    = Child->new('Aida', 'sister', 'Pirate Corps');
my $bellri  = Child->new('Bellri', 'brother', 'Capital Guard');

# $BL>A0(B ( name ) $B$H4X78(B ( relation ) $B$r=PNO(B
print $parent->name. ": ". $parent->relation ."\n";
print $anon->name. ": ". $anon->relation .", ". $anon->affiliation ."\n";
print $aida->name. ": ". $aida->relation .", ". $aida->affiliation ."\n";
print $bellri->name. ": ". $bellri->relation .", ". $bellri->affiliation ."\n";

print "---\n";

# $B@8B8$7$F$$$k%$%s%9%?%s%9$r=PNO(B
print "A living instance:\n", map("  $_\n", Parent->registered);

# $B%W%m%0%i%`$N=*N;(B
print "End of program\n";



