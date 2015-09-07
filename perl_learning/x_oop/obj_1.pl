#!/usr/bin/perl

use strict;
use warnings;

# sub Cow::sound
# sub Cow::speak と同じ
{ package Cow;
  sub sound { 'mooo' }
  sub speak {
    my $class = shift;
    print "a $class goes", $class->sound, "!\n";
  }
}
{ package Horse;
  sub sound { 'neigh' }
  sub speak {
    my $class = shift;
    print "a $class goes", $class->sound, "!\n";
  }
}
{ package Sheep;
  sub sound { 'baaah' }
  sub speak {
    my $class = shift;
    print "a $class goes", $class->sound, "!\n";
  }
}

#Sheep::speak('Sheep');
my @classes = qw( Cow Horse Sheep );
foreach my $class( @classes ) {
  $class->speak;
  # シンボリックコードレフ
  # (use strict が有効だと"strict refs" エラー)
  #&{$class.'::speak'}($class);
}


