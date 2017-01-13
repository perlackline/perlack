#!/usr/bin/perl

use strict;
use warnings;

# check destroy
# create temp file..

package Animal;
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

sub DESTROY {
  my $self = shift;
  print '[', $self->name, "] has died.\n"; 
}


package Horse;
our @ISA = qw( Animal );

sub DESTROY {
  my $self = shift;
  print "Bye! by Horse.\n";
  #$self->SUPER::DESTROY if $self->can("SUPER::DESTROY");
  foreach my $class (@ISA) {
    $class .= "::DESTROY"; 
    #my $destory = $class. "::DESTROY"; 
    #my $destory = "${class}::DESTROY"; 
    print ">> $class\n";
    #print ">> $destory\n";
    $self->$class if $self->can($class);
    #$self->$destory if $self->can($destory);
  }

}

package main;

use Horse;

my $horse = Horse->new('Mr. Ed');;
print $horse->name, "\n";

print "End of program.\n";

