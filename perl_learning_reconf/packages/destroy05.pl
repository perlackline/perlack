#!/usr/bin/perl

use strict;
use warnings;

# check destroy

# クラス 動物
package Animal;
sub new {
  my $class = shift;
  my $name = shift || 'Tarou';
  bless { Name => $name }, $class;
}

sub name {
  my $either = shift;
  ref $either ? $either->{Name} : "an unnamed $either";
}

# Animal のデストラクタ
sub DESTROY {
  my $self = shift;
  warn '[', $self->name, " has died.]\n";
}

# クラス 牛
package Cow;
our @ISA = qw(Animal);

# クラス 家畜小屋 
package Barn;
sub new { bless [], shift }
sub add { 
  #push @{+shift}, shift;
  my $self = shift;
  push @{$self}, shift;
  }

sub contents {
  # @{+shift};
  my $self = shift;
  @{$self};
}

# Barn のデストラクタ
sub DESTROY {
  my $self = shift;
  print "$self is being destroyed...\n";
  foreach ($self->contents) {
    print ' ', $_->name, " goes homeless.\n";
  }
}

package main;

my $barn = Barn->new;
$barn->add(Cow->new('cow_01'));
$barn->add(Cow->new('cow_02'));

# 家畜小屋を燃やす
print "Burn the barn:\n";
$barn = undef;

use Data::Dumper;
print Dumper $barn;

print "End of program.\n";

