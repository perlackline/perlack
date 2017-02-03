package People2;

use strict;
use warnings;

# Exporter を継承
use parent qw(Exporter);

# デフォルトのシンボルをセット
our @EXPORT_OK = qw(set_name get_name);

my $atr = {Name => 'anonimous'};
# 名前をセットするサブルーチン
sub set_name {
  my $name = shift;
  $atr->{Name} = $name;
}
# 名前をゲットするサブルーチン
sub get_name {
  $atr->{Name};
}

