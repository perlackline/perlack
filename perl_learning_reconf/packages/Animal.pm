use strict;
use warnings;

# for destroy03.pl

package Animal;
our $VERSION = '0.1.0';
# コンストラクタ
sub named {
  my $class = shift;
  my $name = shift || 'Tarou';
  #bless \$name, $class;
  my $self = { Name => $name, Color => $class->default_color }; 
  bless $self, $class;
}

sub self_ref {
  my $self = shift;
  $self->{self_ref} = $self;
}

sub default_color { 'brown' }

sub color {
  my $self = shift;
  $self->{Color} = shift if @_;
  $self->{Color};
}
sub speak {
  my $either = shift;
  print $either->name, " goes ", $either->sound, "!\n";
}
sub name {
  my $either = shift;
  ref $either ? $either->{Name} : "an unnamed $either";
}

sub eat {
  my $either = shift;
  my $food = shift || 'any foods';
  print $either->name, " eats $food.\n";
}

sub DESTROY {
  my $self = shift;
  #print '[', $self->name, " has died.]\n";
  warn '[', $self->name, " has died.]";
  #warn "DESTROYING $self";
  #print "DESTROYING $self";
}

package Cow;
our @ISA = qw( Animal );
our $VERSION = '1.0.0';
sub sound { "mooo" }  

package Horse;
our @ISA = qw( Animal );
sub sound { "neigh" }  

package Sheep;
our @ISA = qw( Animal );
sub sound { "baaah" }  
sub default_color { 'white' }

1;
