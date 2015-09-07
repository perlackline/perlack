#!/usr/bin/perl

use strict;
use warnings;

# 共通するメソッド speak を定義する
# 共通メソッドパッケージ Animal
{ package Animal;
  sub speak {
    my $class = shift;
    print "a $class goes ", $class->sound, "!\n";
  }
}

# @ISA で Animal を継承する 
# これでメソッド speak を継承できる。
# @ISA は our がなければ use strict 下でエラーになる。
# @ISA は use base でも代替可能。
{ package Cow;
  #use base qw( Animal );
  our @ISA = qw( Animal );
  sub sound { 'mooo' }
}
{ package Horse;
  our @ISA = qw( Animal );
  sub sound { 'neigh' }
}
{ package Sheep;
  our @ISA = qw( Animal );
  sub sound { 'baaah' }
}

#Sheep::speak('Sheep');
my @classes = qw( Cow Horse Sheep );
foreach my $class( @classes ) {
  $class->speak;
  # シンボリックコードレフ
  # (use strict が有効だと"strict refs" エラー)
  #&{$class.'::speak'}($class);
}

print "Cow via Animal\n";
Animal::speak('Cow');

