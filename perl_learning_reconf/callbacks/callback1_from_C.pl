#!/usr/bin/perl

use strict;
use warnings;

# https://ja.wikipedia.org/wiki/%E3%82%B3%E3%83%BC%E3%83%AB%E3%83%90%E3%83%83%E3%82%AF_(%E6%83%85%E5%A0%B1%E5%B7%A5%E5%AD%A6)


# ライブラリコード
sub traverse_with {
  my ($ary_ref,$length,$callback,$param) = @_;
  my $exit_code = 0;
  for ( my $i = 0; $i < $length; $i++ ){
    $exit_code = $callback->($i,$ary_ref->[$i],$param);
    if ( $exit_code ) {
     last;
    }
  }
  return $exit_code;
}
# アプリケーションコード
sub search {
  my ($index,$item,$param) = @_;
  if ( $item > 5 ){
    $$param = $index;
    return 1;
  } else {
    return 0;
  }
}

# ライブラリを呼び出す本体
my $array = [qw/0 1 2 3 4 5 6/];
my $index;
my $length = scalar @{$array};
#my $length = $#$array;
my $found = traverse_with($array,$length,\&search,\$index);

if ( $found ){
  #print "Item $found\n";
  print "Item $index\n";
} else {
  print "Not found\n";
}

