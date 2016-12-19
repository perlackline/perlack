#!/usr/bin/perl

use strict;
use warnings;

# check destroy
# inside-out object

use Data::Dumper;

package InsideOut;

use Data::Dumper;

# InsideOut に閉じ込められたハッシュ
my %objects;

# コンストラクタ
sub new {
  my $class = shift;

  # アトリビュートは適当なスカラリファレンス
  bless \eval{ my $scalar }, $class;
}

# デストラクタ
sub DESTROY {
  my $self = shift;

  warn "deleting ", $objects{$self+0};
#
#  print "deleting ", $objects{$self+0}, "\n";
#  print Data::Dumper->Dump( [\%objects],[ '*objects' ]);
#  # 閉じ込められたハッシュエントリを削除
  delete $objects{$self+0};
}

# アクセサ
sub name {
  my $self = shift;
  $objects{$self+0}{name} = shift if @_;
  $objects{$self+0}{name};
}
# アクセサ
sub uri {
  my $self = shift;
  $objects{$self+0}{uri} = shift if @_;
  $objects{$self+0}{uri};
}


package main;


my $obj = InsideOut->new;
$obj->name("Sela");
$obj->uri("http://pointoht.ti-da.net");


print $obj->name, ", ", $obj->uri, "\n";

print "---\n";
print Data::Dumper->Dump([$obj],[qw(*obj)]);


