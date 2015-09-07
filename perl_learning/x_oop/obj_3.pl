#!/usr/bin/perl

use strict;
use warnings;

# メソッドのオーバーライド
# Mouse で speak メソッドをオーバーライドする。

{ package Animal;
  sub speak {
    my $class = shift;
    print "a $class goes ", $class->sound, "!\n";
  }
}

{ package Mouse;
  our @ISA = qw ( Animal );
  sub sound { 'squeak' }
  # メソッド speak のオーバーライド
  sub speak {
    my $class = shift;
    print "a $class goes ", $class->sound, "!\n";
    print "[but you can barely hear it!]\n";
  }
}

{ package Cow;
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

Mouse->speak;
