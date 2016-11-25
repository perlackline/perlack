use strict;
use warnings;

package Dairying;
use strict;
use warnings;
use Class::Trait 'base';
# メソッド animal を強制
our @REQUIRES = qw(animal);
# クラス Mammal と同名のメソッド
# このロールを使うクラス側で Class::Trait の
# alias で別名を当てる
sub produce_milk {
  my $self = shift;
  print "My ". $self->animal. " produce milk.\n";
}

1;
