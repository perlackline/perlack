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
  $REGISTRY{$self} = $self;

  # $B%$%s%9%?%s%9$X$N;2>H$r<e$$%j%U%!%l%s%9$K$9$k(B
  #use Scalar::Util qw(weaken);
  #weaken ($REGISTRY{$self});
  $self;
}

# $B5-21$7$?%$%s%9%?%s%9$rJQ$($9%2%C%?!<(B
sub registered {
  map { 'a '. ref($_) .' named '. $_->name } values %REGISTRY;
}

sub name {
  my $either = shift; 
  ref $either ? $either->{Name} : "an unnamed $either";
}
sub relation { shift->{Relation} }

# $B%G%9%H%i%/%?(B
sub DESTROY {
  my $self = shift;
  warn '['. $self->name .' has died ...]';

  # $B%(%s%H%j$r:o=|$9$k(B
  delete $REGISTRY{$self};
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

# block $BFb$G%3%s%9%H%i%/%H(B
{
  my $parent  = Parent->new('Rayhunton');
  my $anon    = Child->new('anon', 'orphan');
  print "(in block):\n", map("  $_\n", Parent->registered);
}

# block $B30$G%3%s%9%H%i%/%H(B
my $aida    = Child->new('Aida', 'sister', 'Pirate Corps');
my $bellri  = Child->new('Bellri', 'brother', 'Capital Guard');
print "(after block):\n", map("  $_\n", Parent->registered);

print "---\n";
print "End of program\n";



