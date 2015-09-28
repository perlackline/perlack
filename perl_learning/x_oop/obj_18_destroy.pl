#!/usr/bin/perl

use strict;
use warnings;

# P167
# オブジェクトのデストラクション

# color, named, name, speak, default_color, eat
# adding DESTROY in Animal and sub feed_a_cow_named
{ package Animal;

  sub DESTROY {
    my $self = shift;
    print '[', $self->name, " has died.]\n";
  }

  sub color {
    my $self = shift;
    # 他に引数があればゲッター
    if (@_) {
      $self->{Color} = shift;
    } else {
    # 他に引数がなければセッター
      $self->{Color};
    }
  }

  sub named {
    my $class = shift;
    my $name  = shift;
    my $self = { Name => $name, Color => $class->default_color };
    bless $self, $class;
  }

  sub name {
    my $either = shift;
    # $either はリファレンス (インスタンス) か ?
    ref $either
    ? $either->{Name}       # インスタンスの場合はデリファレンス
    : "an unnamed $either"; # クラスの場合はまま名前を返す
  }

  sub speak {
    my $either = shift;
    print $either->name, ' goes ', $either->sound, "!\n";
  }

  sub default_color { 'brown' }

  sub eat {
    my $either = shift;
    my $food   = shift;
    print $either->name, " eats $food.\n";
  }
}

{ package Horse;
  our @ISA = qw( Animal );
  sub sound { 'neigh' }
  sub default_color { 'white' }
}

{ package Sheep;
  our @ISA = qw( Animal );
  sub sound { 'grass' }
  sub default_color { 'white' }
}

# adding
{ package Cow;
  our @ISA = qw( Animal );
}

# Adding
sub feed_a_cow_named {
  my $name = shift;
  my $cow  = Cow->named($name);
  $cow->eat('grass');
  # $cow はここで破棄される
  print "Returning from the subroutine.\n";
}

print "Start of program.\n";
my $outer_cow = Cow->named('Bessie');
print "Now have a cow named ", $outer_cow->name, ".\n";
feed_a_cow_named('Gwen');
print "Returned from subroutine.\n";

