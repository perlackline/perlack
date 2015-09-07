#!/usr/bin/perl

#use strict;
use warnings;

# (P.133) :: の左はパッケージ名
sub Cow::speak {
  my $class = shift;
  print "a $class goes mooo!\n";
}
sub Horse::speak {
  my $class = shift;
  print "a $class goes neigh!\n";
}
sub Sheep::speak {
  my $class = shift;
  print "a $class goes baaah!\n";
}

#Sheep::speak('Sheep');
my @classes = qw( Cow Horse Sheep );
foreach my $class( @classes ) {
  $class->speak;
  # シンボリックコードレフ
  # (use strict が有効だと"strict refs" エラー)
  #&{$class.'::speak'}($class);
}


