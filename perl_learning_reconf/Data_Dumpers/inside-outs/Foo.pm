package Foo;
use strict;
use Scalar::Util qw(refaddr);
my %bar_of; #field "bar"
sub new{
  my $self = bless \do{ my $anon }, shift;
  $bar_of{refaddr $self} = shift;
  return $self;
}
sub DESTROY{
  my $self = shift;
  delete $bar_of{refaddr $self};
  return;
}
sub get_bar{
  my $self = shift;
  return $bar_of{refaddr $self};
}

1;
__END__

