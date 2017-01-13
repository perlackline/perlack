#!/usr/bin/perl

use strict;
use warnings;

# check override

package Animal;

# コンストラクタ
sub new {
  my $class = shift;
  my $name = shift || 'Tarou';
  my $self = { Name => $name };

  bless $self, $class;
}

# 名前のアクセサ
sub name {
  my $either = shift;
  ref $either ? $either->{Name} : "an unnamed $either";
}
sub speak {
  my $either = shift;
  print "In the ", ref $either, "! ", $either->name, ' goes ', $either->sound, "\n";
}

sub sound { 'hummm...' }

# デストラクタ
sub DESTROY {
  my $self = shift;
  warn '[', $self->name, " has died.]\n";
}

package Horse;
our @ISA = qw(Animal);

sub sound { 'neigh' }

package RaceHorse;
our @ISA = qw(Horse);
sub new {
  my $self = shift->SUPER::new(@_);
  #foreach (qw(wins places shows losses)){
  #  $self->{$_} = 0;
  #}
  ($self->{$_} = 0) for qw(wins places shows losses);
  $self;
}
sub won {
  shift->{wins}++;
}
sub placed {
  shift->{places}++;
}
sub showed {
  shift->{shows}++;
}
sub lost {
  shift->{losses}++;
}
sub standings {
  my $self = shift;
  join ',', map "$self->{$_} $_", qw(wins places shows losses);
} 

package main;

my $racer = RaceHorse->new();
$racer->won;
$racer->won;
$racer->won;
$racer->showed;
$racer->lost;

print $racer->name, ' has standings of: ', $racer->standings, ".\n";


print "$_ " for qw(one two three);
print "\n";
