package People;

use strict;
use warnings;

my $modules_scalar = 'Hello';
my @modules_array  = qw/one two three/;
my %modules_hash   = (key => 'val');

sub import {
  my $package = caller;
  no strict 'refs';

  *{$package. "::modules_scalar"} = \$modules_scalar;
  *{$package. "::modules_array"} = \@modules_array;
  *{$package. "::modules_hash"} = \%modules_hash;

  for (qw( set_name get_name set_age get_age )){
    *{$package. "::$_"} = \&$_;

    # or
    #*{"$package\::$_"} = \&$_;
  }
}

# アトリビュートを無名ハッシュレフで格納するためのスカラ
my $atr = {};

# 名前をセットするサブルーチン
sub set_name {
  my $name = shift;
  $atr->{Name} = $name;
}
# 名前をゲットするサブルーチン
sub get_name {
  if ($atr->{Name}){
    $atr->{Name};
  }else{
    "Please use set_name() first";
  }
}

