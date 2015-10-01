#!/usr/bin/perl

use strict;
use warnings;

# P172
# ネストしたオブジェクトのデストラクション
# Adding Fiel::Temp, tempfile to named()

# color, named, name, speak, default_color, eat
# DESTROY in Animal
{ package Animal;

  use File::Temp qw(tempfile);

  sub named {
    my $class = shift;
    my $name  = shift;
    my $self = { Name => $name, Color => $class->default_color };
    # adding start 'make temp file'
    my ($fh, $filename) = tempfile();
    $self->{temp_fh} = $fh;
    $self->{temp_filenam} = $filename;
    # adding end
    bless $self, $class;
  }

  # DESTROY で一時ファイルを確実に削除する
  sub DESTROY {
    my $self = shift;
    # Change with temp file
    # ファイルハンドルを close してファイルを削除する
    my $fh = $self->{temp_fh};
    close $fh;
    unlink $self->{temp_filenme};
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

{ package Barn;
  sub new { bless [ ], shift }
  sub add { push @{+shift}, shift }
  sub contents { @{+shift} }
  sub DESTROY {
    my $self = shift;
    print "$self is being destroyed...\n";
    for ($self->contents) {
      print ' ', $_->name, "(", $_->color, ") goes homeless.\n";
    }
  }
}
{ package Barn2;
  sub new { bless [ ], shift }
  sub add { push @{+shift}, shift }
  sub contents { @{+shift}, shift }
  sub DESTROY {
    my $self = shift;
    print "$self is being destroyed...\n";
    while (@$self) {
      my $homeless = shift @$self;
      print ' ', $homeless->name, " goes homeless.\n";
    }
  }
}

use Data::Dumper;

my $barn = Barn2->new;
$barn->add(Cow->named('Bessie'));
$barn->add(Cow->named('Gwen'));
print Dumper($barn);
print "Burn the barn:\n";
$barn = undef;
print "End of program.\n";

