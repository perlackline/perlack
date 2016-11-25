use strict;
use warnings;

package Fly;
use strict;
use warnings;
# ロール (トレイト) の基底 (?)
use Class::Trait 'base';
# ロール Fly を利用するクラスに fly_with の実装を強制
our @REQUIRES = qw(fly_with);
sub fly {
  my $self = shift;
  print "I can fly with ". $self->fly_with. ".\n";
}

1;
