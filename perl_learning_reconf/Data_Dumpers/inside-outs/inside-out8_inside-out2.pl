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

# InsideOut Object を Class::Std で簡単に

package Address;
use strict;
use warnings;
use Carp;
use Class::Std;
{
  # + :ATTR は属性 (attribute) 
  #   属性 :ATTR によって指定した変数をガベージコレクションに
  #   送ってくれる
  # + :name<address> で変数のセッター, ゲッターを自動生成する
  #   get<address>, set<address> で個別に指定も可能
  # + :init_arg<address> は new 呼び出し時に利用する
  #   引数の key を定義
  #   http://d.hatena.ne.jp/cooldaemon/20060317/1142562536
  my %address :ATTR(:name<address> :init_arg<address>);

  sub set_name {
    my ($self,$name) = @_;
    $address{ ident $self }->{name} = $name;
  }

  sub set_add {
    my ($self, $add) = @_;
    $address{ ident $self }->{add} = $add;
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


