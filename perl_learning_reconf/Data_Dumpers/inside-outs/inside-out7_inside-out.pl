#!/usr/bin/perl

#use strict;
#use warnings;

# http://www.chikkun.com/und/document/perl/inside_out.html
# 変数のスコープからインサイドアウトクラスまで

# https://groups.google.com/forum/#!topic/yuruperl-nagoya/eUZCps2LIqs
# Class::Std::Utils って 何をするモジュールでしょうか

# InsideOut Object

# closure の特性を利用してこれまでの Perl オブジェクト指向の
# 標準規則をことごとく "ひっくりかえした" (inside-out) オブジェクト

package Address;
use strict;
use warnings;
use Carp;
use Class::Std::Utils;
{
  my %address;

  sub new {
    my ($class,$add) = @_;

    # \do { my $anon_scalar } は
    # 無名のスカラリファレンスを返すテクニック
    my $new_object = bless \do { my $anon_scalar },$class;
    if ($add->{address}){
      $address{ ident $new_object } = $add->{address};
    }

    return $new_object;
  }

  sub get_address {
    my ($self) = @_;
    return $address{ ident $self };
  }

  sub set_name {
    my ($self,$name) = @_;
    $address{ ident $self }->{name} = $name;
  }

  sub set_add {
    my ($self, $add) = @_;
    $address{ ident $self }->{add} = $add;
  }

  # inside-out オブジェクトでは変数への参照が残ってしまうため
  # 自前でデストラクタを定義する必要がある
  # ここではメソッド set_name から %address への参照が残るため
  # 確実に delete する
  sub DESTROY {
    my ($self) = @_;
    delete $address{ ident $self };

  return;
  }
}

# --------------------
package main;

my $address = { add => 'Tokyo', tel => '090-xxxx-xxxx', name => 'sakai' };
my $instance = Address->new({address => $address});
my $a = $instance->get_address;

foreach my $key (keys %$a){
  print $key, ":", $$a{$key}, "\n";
}

$instance->set_name("tomoko");
$instance->set_add("Osaka");

$a = $instance->get_address;

foreach my $key (keys %$a){
  print $key, ":", $$a{$key}, "\n";
}


