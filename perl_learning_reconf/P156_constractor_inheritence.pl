#!/usr/bin/perl

use strict;
use warnings;

{ package Animal;
  sub speak {
    #my $class = shift;
    #print "a $class goes ", $class->sound, "!\n";

    # either を使うように修正
    my $either = shift;
    print $either->name, ' goes ', $either->sound, "\n";
  }

  # クラスとインスタンス双方からの呼び出しに対応
  sub name {
    #my $self = shift;
    my $either= shift;
    ref $either
      ? $$either            # インスタンスなので名前を返す
      : "an unnamed $either"; # クラスなので汎用の値を返す
    #$$self;
  }
  sub named {
    my $class = shift;
    my $name = shift;
    bless \$name, $class;
  }
}
{ package Horse;
  our @ISA = qw(Animal);
  sub sound { 'neigh' }
}

print Horse->name, "\n";
print Horse->speak, "\n";

my $tv_horse = Horse->named('Mr. Ed');
#$tv_horse->speak;
print $tv_horse->name, "\n";
print $tv_horse->speak, "\n";

